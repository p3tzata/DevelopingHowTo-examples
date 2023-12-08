package com.example.springbatch.order.service;


import com.example.springbatch.order.reposotiry.OrderRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

}
