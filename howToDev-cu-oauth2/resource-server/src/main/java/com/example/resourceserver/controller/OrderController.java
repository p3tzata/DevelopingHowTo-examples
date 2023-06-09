package com.example.resourceserver.controller;

import com.example.resourceserver.model.Order;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
public class OrderController {

  @GetMapping("/getAll")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<List<Order>> getAll(@AuthenticationPrincipal Jwt jwt ) {

    List<Order> orders = List.of(Order.builder().id(1L).orderCode("order1").build(),
        Order.builder().id(2L).orderCode("order2").build());

    return ResponseEntity.ok(orders);
  }

}
