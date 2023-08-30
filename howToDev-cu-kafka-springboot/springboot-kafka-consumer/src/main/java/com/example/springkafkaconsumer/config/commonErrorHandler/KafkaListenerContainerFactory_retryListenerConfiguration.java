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

/**
 * KafkaListenerContainerFactory_retryListenerConfiguration - this is not used regular basis.
 */

@Configuration
@Slf4j
public class KafkaListenerContainerFactory_retryListenerConfiguration {

  @Autowired
  KafkaProperties kafkaProperties;

  @Value("${myAppSetting.kafka.topicRetryListener.retry}")
  private long retry;

  @Bean(name = "kafkaListenerContainerFactory_retryListener")
  ConcurrentKafkaListenerContainerFactory<?, ?> kafkaListenerContainerFactory(
      ConcurrentKafkaListenerContainerFactoryConfigurer configurer,
      ObjectProvider<ConsumerFactory<Object, Object>> kafkaConsumerFactory) {

    ConcurrentKafkaListenerContainerFactory<Object, Object> factory = new ConcurrentKafkaListenerContainerFactory<>();
    configurer.configure(factory, kafkaConsumerFactory
        .getIfAvailable(() -> new DefaultKafkaConsumerFactory<>(this.kafkaProperties.buildConsumerProperties())));
    factory.setConcurrency(3);
    factory.setCommonErrorHandler(retryListener());
    return factory;
  }

  public DefaultErrorHandler retryListener() {

    var fixedBackOff = new FixedBackOff(1000L, retry);

    var defaultErrorHandler = new DefaultErrorHandler(fixedBackOff);

    defaultErrorHandler.setRetryListeners(((record, ex, deliveryAttempt) -> {
      log.warn("Failed receive record, ex: {}, deliveryAttempt: {}", ex.getMessage(), deliveryAttempt);
    }));

    return defaultErrorHandler;
  }

}
