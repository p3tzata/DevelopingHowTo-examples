package com.example.springdata.service;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.repository.OrderRepository;
import com.example.springdata.util.DBTransactionHelper;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionSynchronizationManager;

@Service
public class OrderService {

  OrderRepository orderRepository;
  OrderService2 orderService2;
  DBTransactionHelper dbTransactionHelper;

  @Autowired
  public OrderService(OrderRepository orderRepository, OrderService2 orderService2, DBTransactionHelper dbTransactionHelper) {

    this.orderRepository = orderRepository;
    this.orderService2 = orderService2;
    this.dbTransactionHelper = dbTransactionHelper;

  }

  @Transactional
  public OrderEntity saveWithTransactional(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    return orderRepository.save(orderEntity);

  }


  @Transactional
  public OrderEntity passToService2(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    return orderService2.saveWithTransaction(orderEntity);

  }

  @Transactional
  public OrderEntity passToService2_newTransaction(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);
    orderEntity.setId(2L);

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    return orderService2.saveWithNewTransaction(orderEntity);

  }

  @Transactional
  public OrderEntity passToService2_newTransactionThrowError(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);
    orderEntity.setId(2L);

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    return orderService2.saveWithNewTransactionThrowError(orderEntity);

  }


  public OrderEntity saveWithOutTransactional(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    return orderRepository.saveAndFlush(orderEntity);

  }

  @Transactional
  public void saveWithDBTransactionHelper(OrderEntity orderEntity) {

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    dbTransactionHelper.executeInTransaction(() ->
        orderService2.saveWithTransaction(orderEntity)
    );

  }

  @Transactional
  public void saveWithDBTransactionHelper_retry(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    orderEntity.setId(2L);

    dbTransactionHelper.executeWithRetryInTransactionAndGet(() ->
        orderService2.saveWithTransaction(orderEntity), 5, 500);


  }

  @Transactional
  public void saveWithDBTransactionHelper_retry_and_throwError(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    try {
      orderEntity.setId(2L);

      dbTransactionHelper.executeWithRetryInTransactionAndGet(() ->
          orderService2.saveWithTransactionThrowError(orderEntity), 5, 500);

    }
    catch (Exception ex) {
      String message = ex.getMessage();
    }

  }

  @Transactional
  public void saveWithDBTransactionHelper_retryWithNewTransaction_and_throwError(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);

    if (TransactionSynchronizationManager.isActualTransactionActive()) {

      String transactionId = TransactionSynchronizationManager.getCurrentTransactionName();

    }
    try {
      orderEntity.setId(2L);

      dbTransactionHelper.executeWithRetryInNewTransactionAndGet(() ->
          orderService2.saveWithTransactionThrowError(orderEntity), 5, 500);

    }
    catch (Exception ex) {
      String message = ex.getMessage();
    }

  }

  @Transactional
  public void saveAndPassToService2(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);
    try {
      orderEntity.setId(2L);
      orderService2.saveWithTransactionThrowError(orderEntity);
    } catch (Exception exception) {
      exception.getMessage();
    }


  }

  @Transactional
  public void saveAndPassToService2WithNewTransaction(OrderEntity orderEntity) {

    orderRepository.saveAndFlush(orderEntity);
    try {
      orderEntity.setId(2L);
      orderService2.saveWithNewTransactionThrowError(orderEntity);
    } catch (Exception exception) {
      exception.getMessage();
    }
  }



}
