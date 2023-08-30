package com.example.springkafkaconsumer.service;

import com.example.springkafkaconsumer.model.Event;
import com.example.springkafkaconsumer.model.Order;
import com.example.springkafkaconsumer.model.OrderEventType;
import com.example.springkafkaconsumer.persistence.order.enity.OrderEntity;
import com.example.springkafkaconsumer.persistence.order.repository.OrderRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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

    checkToSimulateException(orderEntity);

    orderRepository.saveAndFlush(orderEntity);

    log.info("Processed order event: {}", orderEvent);
  }

  private void checkToSimulateException(OrderEntity orderEntity) {

    if (orderEntity.getOrderCode() == null) {
      throw new IllegalArgumentException("Order Code is null");
    }

    if (orderEntity.getOrderId()==6969) {
      throw new RecoverableDataAccessException("Simulate db error");
    }
  }


}
