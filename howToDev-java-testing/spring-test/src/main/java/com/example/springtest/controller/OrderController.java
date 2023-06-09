package com.example.springtest.controller;

import com.example.springtest.model.Order;
import com.example.springtest.model.OrderSearchCriteria;
import com.example.springtest.service.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
public class OrderController {

  private OrderService orderService;

  @Autowired
  public OrderController(OrderService orderService) {

    this.orderService = orderService;
  }

  @GetMapping("/getWithSearchCriteria")
  public ResponseEntity<List<Order>> getWithSearchCriteria(OrderSearchCriteria orderSearchCriteria) {

    return ResponseEntity.status(HttpStatus.OK).body(orderService.getWithCriteria(orderSearchCriteria));

  }

}
