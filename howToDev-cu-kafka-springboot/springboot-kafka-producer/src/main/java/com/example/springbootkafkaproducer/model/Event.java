package com.example.springbootkafkaproducer.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Event<T,P> {

  long eventId;
  T eventType;
  P payload;

}
