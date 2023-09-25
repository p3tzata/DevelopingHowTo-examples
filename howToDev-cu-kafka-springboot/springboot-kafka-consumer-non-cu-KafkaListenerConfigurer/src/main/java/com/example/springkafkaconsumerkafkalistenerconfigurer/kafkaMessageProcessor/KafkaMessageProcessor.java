package com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.kafka.clients.consumer.ConsumerRecord;

public interface KafkaMessageProcessor {

  void process(ConsumerRecord<String, String> data) throws JsonProcessingException;

  String getTopicName();

}
