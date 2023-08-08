package com.example.springkafkaconsumer.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.listener.AcknowledgingMessageListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.stereotype.Component;

/**
## OrderEventConsumerManualOffsetCommit (@KafkaListener):
 - manual offset commit - this take great control of commit by our app.
 - to use manual offset in application.yml - spring.kafka.listener.ack-mode=manual

*/
@ConditionalOnProperty(
    value="spring.kafka.listener.ack-mode",
    havingValue = "manual",
    matchIfMissing = false)
@Component
@Slf4j
public class OrderEventConsumerManualOffsetCommit implements AcknowledgingMessageListener<String, String> {

  @Override
  @KafkaListener(topics = {"order-event-topic"})
  public void onMessage(ConsumerRecord<String, String> consumerRecord, Acknowledgment acknowledgment) {
    log.info("Consumed record(ManualOffsetCommit): {}", consumerRecord);

    /**
     * acknowledge() will acknowledge the offset. That has been read the message.
     *
     * If we don't call acknowledge() while we are in spring.kafka.listener.ack-mode=manual
     *  - consumerRecord will be read, but LAG will increment
     *  - after restart the instance of consumer we will read once again(infinite loop)
     *
     */

    acknowledgment.acknowledge();
  }
}
