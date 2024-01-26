package com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.kafka.clients.consumer.ConsumerRecord;

public interface KafkaMessageProcessor {

  void process(ConsumerRecord<String, String> data) throws JsonProcessingException;

  String getTopicName();

}
