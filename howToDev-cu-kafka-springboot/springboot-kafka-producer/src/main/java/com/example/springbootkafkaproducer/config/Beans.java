package com.example.springbootkafkaproducer.config;

import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;

@Configuration
public class Beans {

  @Bean
  public NewTopic createOrderEventTopic() {
    //## Programmatically Creation of Topic is NOT RECOMMENDED FOR PRODUCTION ENVIRONMENT
    return TopicBuilder.name("order-event-topic-dev")
        .partitions(3)
        .replicas(3)
        .build();
  }
}
