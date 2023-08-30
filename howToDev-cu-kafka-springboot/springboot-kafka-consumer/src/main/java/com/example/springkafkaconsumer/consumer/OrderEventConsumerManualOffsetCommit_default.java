package com.example.springkafkaconsumer.consumer;

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

/**
 * ## OrderEventConsumerManualOffsetCommit (@KafkaListener):
 * - manual offset commit - this take great control of commit by our app.
 * - to use manual offset in application.yml - spring.kafka.listener.ack-mode=manual
 */
@ConditionalOnProperty(
    value = "spring.kafka.listener.ack-mode",
    havingValue = "manual",
    matchIfMissing = false)
@Component
@Slf4j
public class OrderEventConsumerManualOffsetCommit_default implements AcknowledgingMessageListener<String, String> {

  private OrderService orderService;

  @Autowired
  public OrderEventConsumerManualOffsetCommit_default(OrderService orderService) {

    this.orderService = orderService;
  }

  @Override
  @KafkaListener(topics = {"${myAppSetting.kafka.topic}"})
  public void onMessage(ConsumerRecord<String, String> consumerRecord, Acknowledgment acknowledgment) {

    log.info("Consumed record(ManualOffsetCommit - default): {}", consumerRecord);

    /**
     * acknowledge() will acknowledge the offset. That has been read the message.
     *
     * If we don't call acknowledge() while we are in spring.kafka.listener.ack-mode=manual
     *  - consumerRecord will be read, but LAG will increment
     *  - after restart the instance of consumer we will read once again(infinite loop)
     *
     */
    try {
      orderService.processConsumerRecord(consumerRecord);
      acknowledgment.acknowledge();
    }
    catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }


  }
}
