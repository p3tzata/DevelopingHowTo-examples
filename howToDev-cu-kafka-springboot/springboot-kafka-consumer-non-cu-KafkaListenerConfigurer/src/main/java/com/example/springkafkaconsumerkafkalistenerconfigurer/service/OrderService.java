package com.example.springkafkaconsumerkafkalistenerconfigurer.service;

import com.example.springkafkaconsumerkafkalistenerconfigurer.persistence.order.entity.OrderEntity;
import com.example.springkafkaconsumerkafkalistenerconfigurer.persistence.order.repository.OrderRepository;
import com.example.springkafkaconsumerkafkalistenerconfigurer.model.Event;
import com.example.springkafkaconsumerkafkalistenerconfigurer.model.Order;
import com.example.springkafkaconsumerkafkalistenerconfigurer.model.OrderEventType;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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

    log.info("Processed order event: {}", orderEvent);
  }

  private void checkToSimulateException(OrderEntity orderEntity) {

    if (orderEntity.getOrderCode() == null) {
      throw new IllegalArgumentException("Simulate Fatal error");
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
