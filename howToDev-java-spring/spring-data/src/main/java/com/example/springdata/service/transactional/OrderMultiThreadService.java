package com.example.springdata.service.transactional;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.exception.SomeException;
import com.example.springdata.repository.OrderRepository;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderMultiThreadService {

  OrderRepository orderRepository;

  @Autowired
  public OrderMultiThreadService(OrderRepository orderRepository) {

    this.orderRepository = orderRepository;

  }

  @Transactional
  public void inTransactional_mayWaitMayThrowAndSave(String threadName, OrderEntity orderEntity, Long waitMilliSeconds,
      Boolean isThrowError) {

    if (waitMilliSeconds > 0) {
      try {
        System.out.println(threadName+ ": Sleep "+ waitMilliSeconds +" ms.");
        Thread.sleep(waitMilliSeconds);
      }
      catch (InterruptedException e) {
        throw new RuntimeException(e);
      }

      if(isThrowError) {
        System.out.println(threadName+ ": Throw error");
        throw new SomeException("Throw error");
      }
      System.out.println(threadName+ ": try to save");
      orderRepository.saveAndFlush(orderEntity);

    }

  }


}
