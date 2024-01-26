package com.example.springtracermicrometerkafkaconsumer.kafka.factory;

import com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor.KafkaMessageProcessor;
import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerProperties;
import com.example.springtracermicrometerkafkaconsumer.kafka.service.ResetOffsetService;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.TopicPartition;
import org.springframework.kafka.listener.AcknowledgingMessageListener;
import org.springframework.kafka.listener.ConsumerSeekAware;
import org.springframework.kafka.support.Acknowledgment;

@Slf4j
public class KafkaMessageListener implements AcknowledgingMessageListener<String, String>, ConsumerSeekAware {

  private KafkaMessageProcessor kafkaMessageProcessor;
  private ResetOffsetService resetOffsetService;
  private KafkaConsumerProperties properties;

  public KafkaMessageListener(KafkaMessageProcessor kafkaMessageProcessor, ResetOffsetService resetOffsetService,
      KafkaConsumerProperties properties) {

    this.kafkaMessageProcessor = kafkaMessageProcessor;
    this.resetOffsetService = resetOffsetService;
    this.properties = properties;
  }

  @Override
  public void onMessage(ConsumerRecord<String, String> data, Acknowledgment acknowledgment) {

    log.info("Receiving message, topic:{}, key:{}", data.topic(), data.key());
    try {
      kafkaMessageProcessor.process(data);
    }
    catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }
    log.info("Received message, topic:{}, key:{}", data.topic(), data.key());
    acknowledgment.acknowledge();

  }

  @Override
  public void onPartitionsAssigned(Map<TopicPartition, Long> assignments, ConsumerSeekCallback callback) {

    resetOffsetService.handle(assignments, callback, properties);
  }
}
