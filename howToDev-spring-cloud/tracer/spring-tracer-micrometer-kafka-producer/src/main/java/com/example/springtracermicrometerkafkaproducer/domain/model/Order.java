package com.example.springtracermicrometerkafkaproducer.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Order {

  int orderId;
  String orderCode;
}
