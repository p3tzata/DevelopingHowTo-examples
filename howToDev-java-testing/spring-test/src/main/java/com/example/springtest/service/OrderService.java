package com.example.springtest.service;

import com.example.springtest.model.Order;
import com.example.springtest.model.OrderSearchCriteria;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
  public List<Order> getWithCriteria(OrderSearchCriteria orderSearchCriteria) {

    return List.of(Order.builder().id(1L).orderCode("OrderCode1").build(),
        Order.builder().id(2L).orderCode("OrderCode2").build());
  }
}
