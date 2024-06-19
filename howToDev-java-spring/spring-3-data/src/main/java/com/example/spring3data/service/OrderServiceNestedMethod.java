package com.example.spring3data.service;

import com.example.spring3data.entity.OrderEntity;
import com.example.spring3data.repository.OrderRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class OrderServiceNestedMethod {

  OrderRepository orderRepository;

  @Autowired
  public OrderServiceNestedMethod(OrderRepository orderRepository) {

    this.orderRepository = orderRepository;

  }

  @Transactional
  public void methodA() {

    OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(1L).build();
    orderRepository.save(orderEntity);
    methodB();
    log.info("End of method A");
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

  @Transactional
  public void methodC() {

    OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(1L).build();
    orderRepository.save(orderEntity);
    methodD();
    log.info("End of method C");
  }

  private void methodD() {

    try {

      OrderEntity orderEntity = OrderEntity.builder().orderCode("code2").id(2L).build();
      orderRepository.save(orderEntity);
      int i = 9 / 0;
      OrderEntity orderEntity2 = OrderEntity.builder().orderCode("code3").id(3L).build();
      orderRepository.save(orderEntity);
    }
    catch (Exception exception) {
      log.error("ERROR from method D:{}", exception.getMessage());
    }

  }


}
