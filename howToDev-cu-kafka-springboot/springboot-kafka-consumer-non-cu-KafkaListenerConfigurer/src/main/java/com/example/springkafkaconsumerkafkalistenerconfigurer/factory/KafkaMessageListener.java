package com.example.springkafkaconsumerkafkalistenerconfigurer.factory;

import com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.KafkaMessageProcessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.listener.AcknowledgingMessageListener;
import org.springframework.kafka.support.Acknowledgment;

@Slf4j
public class KafkaMessageListener implements AcknowledgingMessageListener<String, String> {

  private KafkaMessageProcessor kafkaMessageProcessor;

  public KafkaMessageListener(KafkaMessageProcessor kafkaMessageProcessor) {

    this.kafkaMessageProcessor = kafkaMessageProcessor;
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
}
