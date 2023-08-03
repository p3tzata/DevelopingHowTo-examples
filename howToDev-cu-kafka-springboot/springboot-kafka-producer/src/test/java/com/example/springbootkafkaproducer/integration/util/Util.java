package com.example.springbootkafkaproducer.integration.util;

import com.example.springbootkafkaproducer.model.Event;


public class Util {

 public static <T,P> Event<T,P> buildEvent(String key,T eventType, P payload) {

    return Event.<T,P>builder()
        .eventKey(key)
        .eventType(eventType)
        .payload(payload)
        .build();
  }
}
