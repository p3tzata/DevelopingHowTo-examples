package com.example.springtracermicrometerkafkaconsumer.domain.service;

import com.example.springtracermicrometerkafkaconsumer.domain.model.Event;
import com.example.springtracermicrometerkafkaconsumer.domain.model.Order;
import com.example.springtracermicrometerkafkaconsumer.domain.model.OrderEventType;
import com.example.springtracermicrometerkafkaconsumer.domain.persistence.entity.OrderEntity;
import com.example.springtracermicrometerkafkaconsumer.domain.persistence.repository.OrderRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.nio.charset.StandardCharsets;
import java.util.Random;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.RecoverableDataAccessException;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OrderService {

  private ObjectMapper objectMapper;
  private OrderRepository orderRepository;

  @Autowired
  public OrderService(ObjectMapper objectMapper, OrderRepository orderRepository) {

    this.objectMapper = objectMapper;
    this.orderRepository = orderRepository;
  }

  public void processConsumerRecord(ConsumerRecord<String, String> consumerRecord) throws JsonProcessingException {

    TypeReference<Event<OrderEventType, Order>> typeRef = new TypeReference<>() {
    };

    Event<OrderEventType, Order> orderEvent = objectMapper.readValue(consumerRecord.value(), typeRef);
    OrderEntity orderEntity = objectMapper.convertValue(orderEvent.getPayload(), OrderEntity.class);
    orderEntity.setTopicName(consumerRecord.topic());
    checkToSimulateException(orderEntity);

    orderRepository.saveAndFlush(orderEntity);
    String parentTrace = new String(consumerRecord.headers().headers("traceparent").iterator().next().value(), StandardCharsets.UTF_8);


    log.info("Processed order event: {}, parent trace: {}", orderEvent, parentTrace);
  }

  private void checkToSimulateException(OrderEntity orderEntity) {

    if (orderEntity.getOrderCode() == null) {
      throw new IllegalArgumentException("Simulate Fatal error");
    }

    if (orderEntity.getOrderId() == 86969) {
      throw new IllegalStateException("Simulate Fatal cause infinity retry");
    }

    if (orderEntity.getOrderId() == 6969) {
      throw new RecoverableDataAccessException("Simulate Db error");
    }

    if (orderEntity.getOrderId() == 69) {

      Random random = new Random();
      int max = 3;
      int i = random.ints(1, max).findFirst().getAsInt();

      if (i == 1) {
        throw new RecoverableDataAccessException("Simulate Random error, chance 1 of " + max);
      }
    }
  }
}
