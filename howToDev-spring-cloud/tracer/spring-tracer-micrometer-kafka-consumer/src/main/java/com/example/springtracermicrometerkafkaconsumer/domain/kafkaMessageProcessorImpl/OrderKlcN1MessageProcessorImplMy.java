package com.example.springtracermicrometerkafkaconsumer.domain.kafkaMessageProcessorImpl;

import com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor.MyKafkaMessageProcessor;
import com.example.springtracermicrometerkafkaconsumer.domain.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class OrderKlcN1MessageProcessorImplMy implements MyKafkaMessageProcessor {

  private OrderService orderService;
  @Value(value = "${myAppSetting.kafka.consumer.klcN1.topic-name}")
  private String topicName;

  @Autowired
  public OrderKlcN1MessageProcessorImplMy(OrderService orderService) {

    this.orderService = orderService;
  }

  //readMe: with @NewSpan here it will generate only new spanId in same traceId.
  // @NewSpan
  @Override
  public void process(ConsumerRecord<String, String> data) throws JsonProcessingException {

    orderService.processConsumerRecord(data);
  }

  @Override
  public String getTopicName() {

    return topicName;
  }
}
