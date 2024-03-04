package com.example.springmicroserviceopenfeign.domain.controller;

import com.example.springmicroserviceopenfeign.domain.model.Order;
import com.example.springmicroserviceopenfeign.domain.service.OrderService;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties.Jwt;
import org.springframework.http.ResponseEntity;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/order")
public class OrderController {

  private OrderService orderService;

  @GetMapping("/getAll")
  @PreAuthorize("isAuthenticated()")
  public ResponseEntity<List<Order>> getAll() {

    List<Order> orders = orderService.getAll();

    return ResponseEntity.ok(orders);
  }

}
