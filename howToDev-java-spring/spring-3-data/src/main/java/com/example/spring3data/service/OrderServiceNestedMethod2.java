package com.example.spring3data.service;

import com.example.spring3data.entity.OrderEntity;
import com.example.spring3data.repository.OrderRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.TransactionSynchronizationManager;

@Service
@Slf4j
public class OrderServiceNestedMethod2 {

  OrderRepository orderRepository;

  @PersistenceContext
  private EntityManager em;

  @Autowired
  public OrderServiceNestedMethod2(OrderRepository orderRepository) {

    this.orderRepository = orderRepository;

  }

  @Transactional
  public void methodA() {

    OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(1L).build();
    orderRepository.save(orderEntity);
    methodB();
    log.info("isRollbackOnly: {}", TransactionAspectSupport.currentTransactionStatus().isRollbackOnly());
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

  /**
   * Because we have flush in methodB1, we have error in db connection, the exception will be thrown in methodB1 despite the
   * try-catch block in methodB1 transaction is rolled back.
   */
  @Transactional
  public void methodA1() {

    OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(1L).build();
    orderRepository.save(orderEntity);
    methodB1();
    TransactionSynchronizationManager.getSynchronizations();
    log.info("isRollbackOnly: {}", TransactionAspectSupport.currentTransactionStatus().isRollbackOnly());
    log.info("End of method A1");
  }

  private void methodB1() {

    try {
      OrderEntity orderEntity = OrderEntity.builder().orderCode("code1").id(2L).build();
      orderRepository.saveAndFlush(orderEntity);
    }
    catch (Exception exception) {
      log.error("ERROR from method B1:{}", exception.getMessage());
    }

  }


  @Transactional
  public void methodC() {

    MDC.getCopyOfContextMap();
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
