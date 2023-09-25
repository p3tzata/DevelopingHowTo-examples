package com.example.springkafkaconsumerkafkalistenerconfigurer.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Event<T,P> {

  String eventKey;
  T eventType;
  P payload;

}
