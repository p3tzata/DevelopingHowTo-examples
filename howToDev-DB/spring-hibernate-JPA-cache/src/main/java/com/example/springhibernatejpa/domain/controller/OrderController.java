package com.example.springhibernatejpa.domain.controller;

import com.example.springhibernatejpa.domain.model.OrderCachableEntity;
import com.example.springhibernatejpa.domain.model.OrderNonCachableEntity;
import com.example.springhibernatejpa.domain.model.OrderRequestBody;
import com.example.springhibernatejpa.domain.repository.OrderCachableRepository;
import com.example.springhibernatejpa.domain.repository.OrderNonCachableRepository;
import jakarta.validation.Valid;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value = "/order")
public class OrderController {

  private OrderCachableRepository orderCachableRepository;
  private OrderNonCachableRepository orderNonCachableRepository;

  @Autowired
  public OrderController(OrderCachableRepository orderCachableRepository, OrderNonCachableRepository orderNonCachableRepository) {

    this.orderCachableRepository = orderCachableRepository;
    this.orderNonCachableRepository = orderNonCachableRepository;
  }


  @PostMapping(value = "/cachable",
      consumes = MediaType.APPLICATION_JSON_VALUE,
      produces = MediaType.APPLICATION_JSON_VALUE)
  @Transactional(timeout = 120)
  public ResponseEntity<Void> postOrderCachableEntity(@RequestBody @Valid final OrderRequestBody orderRequestBody) {

    OrderCachableEntity orderCachable = OrderCachableEntity.builder().orderCode(orderRequestBody.getOrderCode()).build();
    orderCachableRepository.save(orderCachable);

    return ResponseEntity.status(HttpStatus.CREATED).build();

  }

  @PostMapping(value = "/non-cachable",
      consumes = MediaType.APPLICATION_JSON_VALUE,
      produces = MediaType.APPLICATION_JSON_VALUE)
  @Transactional(timeout = 120)
  public ResponseEntity<Void> postOrderNonCachableEntity(@RequestBody @Valid final OrderRequestBody orderRequestBody) {

    OrderNonCachableEntity orderCachable = OrderNonCachableEntity.builder().orderCode(orderRequestBody.getOrderCode()).build();
    orderNonCachableRepository.save(orderCachable);

    return ResponseEntity.status(HttpStatus.CREATED).build();

  }

  @GetMapping(value = "/non-cachable/{orderId}",
      produces = MediaType.APPLICATION_JSON_VALUE)
  @Transactional(timeout = 120)
  public ResponseEntity<OrderNonCachableEntity> getOrderNonCachableEntity(@PathVariable Long orderId) {

    Optional<OrderNonCachableEntity> orderById = orderNonCachableRepository.findById(orderId);

    return orderById.isPresent() ? ResponseEntity.ok(orderById.get()) : ResponseEntity.notFound().build();

  }

  @GetMapping(value = "/cachable/{orderId}",
      produces = MediaType.APPLICATION_JSON_VALUE)
  @Transactional(timeout = 120)
  public ResponseEntity<OrderCachableEntity> getOrderCachableEntity(@PathVariable Long orderId) {

    Optional<OrderCachableEntity> orderById = orderCachableRepository.findById(orderId);

    return orderById.isPresent() ? ResponseEntity.ok(orderById.get()) : ResponseEntity.notFound().build();

  }



}
