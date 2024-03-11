package com.example.springtracermicrometeropenfeign.domain.controller;

import com.example.springtracermicrometeropenfeign.domain.model.Event;
import com.example.springtracermicrometeropenfeign.domain.model.Order;
import com.example.springtracermicrometeropenfeign.domain.model.OrderEventType;
import com.example.springtracermicrometeropenfeign.domain.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/orderEvent")
public class OrderEventFeignController {

  private OrderService orderService;

  @Autowired
  public OrderEventFeignController(OrderService orderService) {

    this.orderService = orderService;
  }

  @PostMapping("/v1/event")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<Event<OrderEventType, Order>> postEvent_sendEvent(@RequestBody Event<OrderEventType, Order> messageBody) {

    log.info("Received orderRequest: {}", messageBody);

    orderService.sendHttpMessage(messageBody);

    log.info("Finished orderRequest: {}", messageBody);

    return ResponseEntity.status(HttpStatus.CREATED).body(messageBody);
  }

}
