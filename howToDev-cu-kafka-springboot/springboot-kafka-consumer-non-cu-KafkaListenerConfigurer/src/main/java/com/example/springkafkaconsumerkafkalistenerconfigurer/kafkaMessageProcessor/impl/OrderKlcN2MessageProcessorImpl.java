package com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.impl;

import com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.KafkaMessageProcessor;
import com.example.springkafkaconsumerkafkalistenerconfigurer.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class OrderKlcN2MessageProcessorImpl implements KafkaMessageProcessor {

  private OrderService orderService;
  @Value(value = "${myAppSetting.kafka.consumer.klcN2.topic-name}")
  private String topicName;

  @Autowired
  public OrderKlcN2MessageProcessorImpl(OrderService orderService) {

    this.orderService = orderService;
  }

  @Override
  public void process(ConsumerRecord<String, String> data) throws JsonProcessingException {

    orderService.processConsumerRecord(data);
  }

  @Override
  public String getTopicName() {

    return topicName;
  }
}
