package com.example.springkafkaconsumer.config.commonErrorHandler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.kafka.ConcurrentKafkaListenerContainerFactoryConfigurer;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.util.backoff.FixedBackOff;

@Configuration
@Slf4j
public class KafkaListenerContainerFactory_simpleErrorHandlerConfiguration {

  @Autowired
  KafkaProperties kafkaProperties;

  @Value("${myAppSetting.kafka.topicSimpleErrorHandler.retry}")
  private long retry;

  @Bean(name = "kafkaListenerContainerFactory_simpleErrorHandler")
  ConcurrentKafkaListenerContainerFactory<?, ?> kafkaListenerContainerFactory(
      ConcurrentKafkaListenerContainerFactoryConfigurer configurer,
      ObjectProvider<ConsumerFactory<Object, Object>> kafkaConsumerFactory) {

    ConcurrentKafkaListenerContainerFactory<Object, Object> factory = new ConcurrentKafkaListenerContainerFactory<>();
    configurer.configure(factory, kafkaConsumerFactory
        .getIfAvailable(() -> new DefaultKafkaConsumerFactory<>(this.kafkaProperties.buildConsumerProperties())));
    factory.setConcurrency(3);
    factory.setCommonErrorHandler(simpleErrorHandler());
    return factory;
  }

  public DefaultErrorHandler simpleErrorHandler() {

    var fixedBackOff = new FixedBackOff(1000L, retry);

    var defaultErrorHandler = new DefaultErrorHandler(fixedBackOff);

    return defaultErrorHandler;
  }

}
