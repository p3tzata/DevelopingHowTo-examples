package com.example.springkafkaconsumer.util;


import com.example.springkafkaconsumer.model.Event;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Util {

  @Autowired
  private ObjectMapper objectMapper;


  public <T, P> Event<T, P> buildEvent(String key, T eventType, P payload) {

    return Event.<T, P>builder()
        .eventKey(key)
        .eventType(eventType)
        .payload(payload)
        .build();
  }

  public <T, P> String buildEventJson(String key, T eventType, P payload) throws JsonProcessingException {

    Event<T, P> event = buildEvent(key, eventType, payload);
    return objectMapper.writeValueAsString(event);

  }

}
