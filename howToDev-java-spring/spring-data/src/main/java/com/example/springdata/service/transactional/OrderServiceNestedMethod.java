package com.example.springdata.service.transactional;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.repository.OrderRepository;
import com.example.springdata.util.DBTransactionHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class OrderServiceNestedMethod {

  OrderRepository orderRepository;

  @Autowired
  public OrderServiceNestedMethod(OrderRepository orderRepository, OrderService2 orderService2,
      DBTransactionHelper dbTransactionHelper) {

    this.orderRepository = orderRepository;

  }

  @Transactional
  public void methodA() {

    OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(1L).build();
    orderRepository.save(orderEntity);
    methodB();

  }

  private void methodB() {

    try {
      OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(2L).build();
      orderRepository.save(orderEntity);
    }
    catch (Exception exception) {
      log.error("ERROR from method B:{}", exception.getMessage());
    }

  }


}
