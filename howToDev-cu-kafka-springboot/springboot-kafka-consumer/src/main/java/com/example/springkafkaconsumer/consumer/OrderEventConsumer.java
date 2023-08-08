package com.example.springkafkaconsumer.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

/**
## OrderEventConsumer (@KafkaListener):
 - even Consumer received multi records, they will pass one by one to method annotated with  @KafkaListener


*/
//@Component - because we focus on OrderEventConsumerManualOffsetCommit
@Slf4j
public class OrderEventConsumer {

  @KafkaListener(topics = {"order-event-topic"})
  public void onMessage(ConsumerRecord<String, String> consumerRecord) {

    log.info("Consumed record: {}", consumerRecord);
  }
}
