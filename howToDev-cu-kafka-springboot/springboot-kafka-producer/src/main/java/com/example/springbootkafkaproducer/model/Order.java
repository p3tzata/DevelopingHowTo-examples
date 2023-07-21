package com.example.springbootkafkaproducer.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Order {

  int orderId;
  String orderCode;
}
