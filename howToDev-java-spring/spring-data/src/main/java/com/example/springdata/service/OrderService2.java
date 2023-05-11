package com.example.springdata.service;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.repository.OrderRepository;
import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.TransactionSynchronizationManager;

@Service
public class OrderService2 {

  OrderRepository orderRepository;
  PlatformTransactionManager platformTransactionManager;

  @Autowired
  public OrderService2(OrderRepository orderRepository, PlatformTransactionManager platformTransactionManager) {

    this.orderRepository = orderRepository;
    this.platformTransactionManager = platformTransactionManager;
  }

  @Transactional
  public OrderEntity saveWithTransaction(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    return orderRepository.saveAndFlush(orderEntity);
  }

  @Transactional
  public OrderEntity saveWithTransactionThrowError(OrderEntity orderEntity) {

    String debug = "debug";
    if (true==true) {
      throw new RuntimeException("Error from saveWithTransactionThrowError");
    }

    return orderRepository.saveAndFlush(orderEntity);
  }



  @Transactional(TxType.REQUIRES_NEW)
  public OrderEntity saveWithNewTransaction(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {
      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
    }
    return orderRepository.saveAndFlush(orderEntity);
  }

  @Transactional(TxType.REQUIRES_NEW)
  public OrderEntity saveWithNewTransactionThrowError(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {
      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();
    }

    String debug = "debug";
    if (true==true) {
      throw new RuntimeException("Error from saveWithTransactionThrowError");
    }

    return orderRepository.saveAndFlush(orderEntity);
  }


}
