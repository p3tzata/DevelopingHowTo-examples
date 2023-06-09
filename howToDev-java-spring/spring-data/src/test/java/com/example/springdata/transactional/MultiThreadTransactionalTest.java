package com.example.springdata.transactional;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.repository.OrderRepository;
import com.example.springdata.service.transactional.OrderMultiThreadService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MultiThreadTransactionalTest {

  @Autowired
  OrderMultiThreadService orderMultiThreadService;
  @Autowired
  OrderRepository orderRepository;
  private OrderEntity orderEntity = OrderEntity.builder()
      .id(1L)
      .orderCode("test")
      .build();
  private OrderEntity orderEntity2 = OrderEntity.builder()
      .id(2L)
      .orderCode("test")
      .build();

  ExecutorService executorService = Executors.newFixedThreadPool(10);

  @BeforeEach
  public void dearDownBefore() {

    orderRepository.deleteAll();
  }

  @AfterEach
  public void dearDownAfter() {

    orderRepository.deleteAll();
  }

  @Test
  public void givenTwoThreadsOnSameTransactionalMethod_whenOneThrowError_thenSecondIsNotImpacted() {

    //Given
    Future<?> thread_1 = executorService.submit(() -> orderMultiThreadService
        .inTransactional_mayWaitMayThrowAndSave("Thread_1", orderEntity, 1000L, false));

    Future<?> thread_2 = executorService.submit(() -> orderMultiThreadService
        .inTransactional_mayWaitMayThrowAndSave("Thread_2", orderEntity2, 200L, true));

    //When
    try {
      thread_1.get();
      thread_2.get();
    }
    catch (Exception ex) {

    }

    //Then
    Assertions.assertEquals(1, orderRepository.findAll().size());
    String debug = "debug";

  }


}
