package com.example.springbootkafkaproducer.controller;

import com.example.springbootkafkaproducer.model.Event;
import com.example.springbootkafkaproducer.model.Order;
import com.example.springbootkafkaproducer.model.OrderEventType;
import com.example.springbootkafkaproducer.producer.OrderEventProducer;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//## OrderEventController - help for trigger sending kafka message.
@Slf4j
@RestController
@RequestMapping("/order")
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

  @PostMapping("/v2/event")
  public ResponseEntity<Event<OrderEventType, Order>> postEvent_sendAndWaitEvent(@RequestBody Event<OrderEventType, Order> requestBody)
      throws JsonProcessingException, ExecutionException, InterruptedException, TimeoutException {

    log.info("Received orderRequest: {}", requestBody);

    orderEventProducer.sendAndWaitEvent(requestBody);

    log.info("Finished orderRequest: {}", requestBody);

    return ResponseEntity.status(HttpStatus.CREATED).body(requestBody);
  }

  @PostMapping("/v3/event")
  public ResponseEntity<Event<OrderEventType, Order>> postEvent_sendWithProducerRecordEvent(@RequestBody Event<OrderEventType, Order> requestBody)
      throws JsonProcessingException, ExecutionException, InterruptedException, TimeoutException {

    log.info("Received orderRequest: {}", requestBody);

    orderEventProducer.sendWithProducerRecordEvent(requestBody);

    log.info("Finished orderRequest: {}", requestBody);

    return ResponseEntity.status(HttpStatus.CREATED).body(requestBody);
  }

}
