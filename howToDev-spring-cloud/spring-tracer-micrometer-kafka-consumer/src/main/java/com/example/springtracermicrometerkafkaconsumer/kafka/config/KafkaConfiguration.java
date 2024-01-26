package com.example.springtracermicrometerkafkaconsumer.kafka.config;

import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerApplicationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.AbstractKafkaListenerContainerFactory;

@Configuration
public class KafkaConfiguration {

  @Bean
  MyContainerFactoryCustomizer containerFactoryCustomizer(AbstractKafkaListenerContainerFactory<?, ?, ?> factory,
      KafkaConsumerApplicationProperties кafkaConsumerApplicationProperties) {

    return new MyContainerFactoryCustomizer(factory, 10000, кafkaConsumerApplicationProperties);

  }

}
