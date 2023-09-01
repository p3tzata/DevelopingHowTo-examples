package com.example.springbootkafkaproducer.producer;

import com.example.springbootkafkaproducer.model.Event;
import com.example.springbootkafkaproducer.model.Order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.header.Header;
import org.apache.kafka.common.header.internals.RecordHeader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;
import org.springframework.util.concurrent.ListenableFuture;

//## KafkaTemplate
@Slf4j
@Component
public class OrderEventProducer {

  private KafkaTemplate<String, String> kafkaTemplate;
  private ObjectMapper objectMapper;

  @Value("${myAppSetting.kafka.topic}")
  private String topicName;

  @Autowired
  public OrderEventProducer(KafkaTemplate<String, String> kafkaTemplate, ObjectMapper objectMapper) {

    this.kafkaTemplate = kafkaTemplate;
    this.objectMapper = objectMapper;
  }

  public void sendEvent(Event<?, Order> event) throws JsonProcessingException {

    String key = event.getEventKey();
    String value = objectMapper.writeValueAsString(event);

    //## For fist call this will block the thread(despite returning ListenableFuture), because getting some metadata from
    // the cluster.
    ListenableFuture<SendResult<String, String>> listenableFuture = kafkaTemplate.send(topicName, key, value);

    listenableFuture.addCallback(
        success -> log.info("Successfully send message with key: {}, success: {}", key, success),
        error -> log.info("Error send message with key: {}, error: {}", key, error));
  }

  public void sendAndWaitEvent(Event<?, Order> event)
      throws JsonProcessingException, ExecutionException, InterruptedException, TimeoutException {

    String key = event.getEventKey();
    String value = objectMapper.writeValueAsString(event);

    /**
     *## For fist call this will block the thread(despite returning ListenableFuture), because getting some metadata from kafka
     *  cluster.
     *  .get(...) will block thread until message is sent.
     *
     */

    SendResult<String, String> sendResult = kafkaTemplate.send(topicName, key, value).get(5L, TimeUnit.SECONDS);

    log.info("Successfully send message with key: {}, success: {}", key, sendResult);

  }

  public void sendWithProducerRecordEvent(Event<?, Order> event)
      throws JsonProcessingException, ExecutionException, InterruptedException, TimeoutException {

    String key = event.getEventKey();
    String value = objectMapper.writeValueAsString(event);
    ProducerRecord<String, String> producerRecord = buildProducerRecord(topicName, key, value);
    ProducerRecord<String, String> producerRecordWithHeader = buildProducerRecordWithHeader(topicName, key, value);

    ListenableFuture<SendResult<String, String>> listenableFuture = kafkaTemplate.send(producerRecordWithHeader);

    listenableFuture.addCallback(
        success -> log.info("Successfully send message with key: {}, success: {}", key, success),
        error -> {
          //SAVE TO DB. AND JOB WILL TRY TO RESEND.
          log.info("Error send message with key: {}, error: {}", key, error);
        });

  }

  public ProducerRecord<String, String> buildProducerRecord(String topicName, String key, String value) {

    return new ProducerRecord<>(topicName, key, value);
  }

  public ProducerRecord<String, String> buildProducerRecordWithHeader(String topicName, String key, String value) {

    List<Header> recordHeaders = List.of(new RecordHeader("recordHeaderKey", "recordHeaderValue".getBytes()));

    //Integer partition = null; //For `null` - Partitioner still will be used for determine which partition will be sent.
    Integer partition = 0;

    return new ProducerRecord<>(topicName, partition, key, value, recordHeaders);

  }


}
