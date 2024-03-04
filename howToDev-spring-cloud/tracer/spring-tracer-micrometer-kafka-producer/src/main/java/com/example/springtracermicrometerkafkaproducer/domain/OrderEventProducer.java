package com.example.springtracermicrometerkafkaproducer.domain;

import com.example.springtracermicrometerkafkaproducer.domain.model.Event;
import com.example.springtracermicrometerkafkaproducer.domain.model.Order;
import com.example.springtracermicrometerkafkaproducer.kafka.MyProducerCallback;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.micrometer.tracing.Tracer;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;


@Slf4j
@Component
public class OrderEventProducer {

  private Tracer tracer;
  private KafkaTemplate<String, String> kafkaTemplate;

  private ObjectMapper objectMapper;

  @Value("${myAppSetting.kafka.producer.klcN1.topic-name}")
  private String topicName;

  @Autowired
  public OrderEventProducer(Tracer tracer, KafkaTemplate<String, String> kafkaTemplate, ObjectMapper objectMapper) {

    this.tracer = tracer;
    this.kafkaTemplate = kafkaTemplate;
    this.objectMapper = objectMapper;
  }

  public void sendEvent(Event<?, Order> event) throws JsonProcessingException {

    String key = event.getEventKey();
    String value = objectMapper.writeValueAsString(event);
    Map<String, String> contextMap = MDC.getCopyOfContextMap();

    log.info("Try send kafka message with traceId: {}, spanId: {}", contextMap.get("traceId"), contextMap.get("spanId"));

    //readMe: For fist call this will block the thread(despite returning ListenableFuture), because getting some metadata from
    // the cluster.
    CompletableFuture<SendResult<String, String>> completableFuture = kafkaTemplate.send(topicName, key, value);

    completableFuture.whenComplete(new MyProducerCallback(tracer.nextSpan(), tracer, log, key));


  }

}
