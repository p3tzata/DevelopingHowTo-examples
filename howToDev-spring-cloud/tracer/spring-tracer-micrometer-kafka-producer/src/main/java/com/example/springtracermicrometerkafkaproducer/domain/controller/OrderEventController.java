package com.example.springtracermicrometerkafkaproducer.domain.controller;

import com.example.springtracermicrometerkafkaproducer.domain.OrderEventProducer;
import com.example.springtracermicrometerkafkaproducer.domain.model.Event;
import com.example.springtracermicrometerkafkaproducer.domain.model.Order;
import com.example.springtracermicrometerkafkaproducer.domain.model.OrderEventType;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/orderEvent")
public class OrderEventController {

  private OrderEventProducer orderEventProducer;

  @Autowired
  public OrderEventController(OrderEventProducer orderEventProducer) {

    this.orderEventProducer = orderEventProducer;
  }

  @PostMapping("/v1/event")
  public ResponseEntity<Event<OrderEventType, Order>> postEvent_sendEvent(@RequestBody Event<OrderEventType, Order> requestBody)
      throws JsonProcessingException {

    log.info("Received orderRequest: {}", requestBody);

    orderEventProducer.sendEvent(requestBody);

    log.info("Finished orderRequest: {}", requestBody);

    return ResponseEntity.status(HttpStatus.CREATED).body(requestBody);
  }

}
