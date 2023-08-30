package com.example.springkafkaconsumer.consumer.commonErrorHandler;

import com.example.springkafkaconsumer.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.listener.AcknowledgingMessageListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.stereotype.Component;

@ConditionalOnProperty(
    value = "spring.kafka.listener.ack-mode",
    havingValue = "manual",
    matchIfMissing = false)
@Component
@Slf4j
public class OrderEventConsumerManualOffsetCommit_simpleErrorHandler implements AcknowledgingMessageListener<String, String> {

  private OrderService orderService;

  @Autowired
  public OrderEventConsumerManualOffsetCommit_simpleErrorHandler(OrderService orderService) {

    this.orderService = orderService;
  }

  @Override
  @KafkaListener(topics = {"${myAppSetting.kafka.topicSimpleErrorHandler.topicName}"}, containerFactory =
      "kafkaListenerContainerFactory_simpleErrorHandler")
  public void onMessage(ConsumerRecord<String, String> consumerRecord, Acknowledgment acknowledgment) {

    log.info("Consumed record(ManualOffsetCommit - simpleErrorHandler): {}", consumerRecord);

    try {
      orderService.processConsumerRecord(consumerRecord);
      acknowledgment.acknowledge();
    }
    catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }


  }
}
