package com.example.springkafkaconsumerkafkalistenerconfigurer.model;

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
