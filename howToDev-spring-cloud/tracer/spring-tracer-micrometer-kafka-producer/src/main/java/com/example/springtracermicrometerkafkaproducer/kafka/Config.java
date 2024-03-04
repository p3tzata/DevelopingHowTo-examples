package com.example.springtracermicrometerkafkaproducer.kafka;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;

@Configuration
public class Config {

  private KafkaProperties kafkaProperties;

  @Autowired
  public Config(KafkaProperties kafkaProperties) {

    this.kafkaProperties = kafkaProperties;
  }

  @Bean
  KafkaTemplate<String, String> kafkaTemplate() {

    Map<String, Object> properties = kafkaProperties.buildProducerProperties();

    DefaultKafkaProducerFactory<String, String> producerFactory =
        new DefaultKafkaProducerFactory<>(properties);

    KafkaTemplate<String, String> kafkaTemplate = new KafkaTemplate<>(producerFactory);

    //readMe: Enable Producer TraceId and SpanId in log.
    kafkaTemplate.setObservationEnabled(true);

    return kafkaTemplate;
  }

}
