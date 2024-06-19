package com.example.springhibernatejparelation;

import com.example.springhibernatejparelation.domain.model.OrderEntity;
import com.example.springhibernatejparelation.domain.model.OrderLineEntity;
import com.example.springhibernatejparelation.domain.repository.OrderRepository;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;

import org.springframework.stereotype.Component;

@Component
public class StartUp implements ApplicationListener<ApplicationReadyEvent> {

  private OrderRepository orderRepository;

  @Autowired
  StartUp(OrderRepository orderRepository) {

    this.orderRepository = orderRepository;
  }

  @Override
  public void onApplicationEvent(final ApplicationReadyEvent event) {

    saveWithElementCollection();

    saveWithOrderLines();


  }

  private void saveWithOrderLines() {

    OrderEntity orderEntity = OrderEntity.builder()
        .orderCode("order2")
        .build();

    orderEntity.setOrderLines(List.of(
        OrderLineEntity.builder().order(orderEntity).quantity(10).build(),
        OrderLineEntity.builder().order(orderEntity).quantity(20).build()
    ));

    orderRepository.save(orderEntity);
  }

  private void saveWithElementCollection() {

    OrderEntity orderEntity = OrderEntity.builder()
        .orderCode("order1")
        .pickerIds(Set.of("picker1", "picker2"))
        .build();

    orderRepository.save(orderEntity);
  }

}
