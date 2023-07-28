package com.example.springbootkafkaproducer.controller;

import com.example.springbootkafkaproducer.model.Event;
import com.example.springbootkafkaproducer.model.Order;
import com.example.springbootkafkaproducer.model.OrderEventType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/order")
public class OrderEventController {

  @PostMapping("/v1/event")
  public ResponseEntity<Event<OrderEventType, Order>> postEvent(@RequestBody Event<OrderEventType, Order> requestBody) {

    log.info("Received orderRequest: {}", requestBody);
    //call kafka producer.
    return ResponseEntity.status(HttpStatus.CREATED).body(requestBody);
  }
}
