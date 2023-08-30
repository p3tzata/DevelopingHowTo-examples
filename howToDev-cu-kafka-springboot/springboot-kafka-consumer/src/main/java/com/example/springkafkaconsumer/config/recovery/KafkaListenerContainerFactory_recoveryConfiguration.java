package com.example.springkafkaconsumer.config.recovery;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.common.TopicPartition;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.kafka.ConcurrentKafkaListenerContainerFactoryConfigurer;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.RecoverableDataAccessException;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.listener.DeadLetterPublishingRecoverer;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.util.backoff.FixedBackOff;

@Configuration
@Slf4j
public class KafkaListenerContainerFactory_recoveryConfiguration {

  private KafkaProperties kafkaProperties;

  private KafkaTemplate kafkaTemplate;

  @Value("${myAppSetting.kafka.topicRecover.retry.retryTopicName}")
  private String retryTopicName;

  @Value("${myAppSetting.kafka.topicRecover.dtl.deadLetterTopicName}")
  private String deadLetterTopicName;


  KafkaListenerContainerFactory_recoveryConfiguration(KafkaProperties kafkaProperties, KafkaTemplate kafkaTemplate) {

    this.kafkaProperties = kafkaProperties;
    this.kafkaTemplate = kafkaTemplate;
  }


  @Value("${myAppSetting.kafka.topicRecover.normal.retry}")
  private long retry;

  @Value("${myAppSetting.kafka.topicRecover.normal.intervalRetry}")
  private long intervalRetry;

  @Bean(name = "kafkaListenerContainerFactory_recovery")
  ConcurrentKafkaListenerContainerFactory<?, ?> kafkaListenerContainerFactory(
      ConcurrentKafkaListenerContainerFactoryConfigurer configurer,
      ObjectProvider<ConsumerFactory<Object, Object>> kafkaConsumerFactory) {

    ConcurrentKafkaListenerContainerFactory<Object, Object> factory = new ConcurrentKafkaListenerContainerFactory<>();
    configurer.configure(factory, kafkaConsumerFactory
        .getIfAvailable(() -> new DefaultKafkaConsumerFactory<>(this.kafkaProperties.buildConsumerProperties())));
    factory.setConcurrency(3);
    factory.setCommonErrorHandler(recoverErrorHandler());
    return factory;
  }

  public DefaultErrorHandler recoverErrorHandler() {

    var fixedBackOff = new FixedBackOff(intervalRetry, retry);

    var defaultErrorHandler = new DefaultErrorHandler(publishingRecover(), fixedBackOff);

    return defaultErrorHandler;
  }

  public DeadLetterPublishingRecoverer publishingRecover() {

    DeadLetterPublishingRecoverer recover = new DeadLetterPublishingRecoverer(kafkaTemplate
        , (r, e) -> {
      log.error("Exception in publishingRecoverer : {} ", e.getMessage(), e);
      if (e.getCause() instanceof RecoverableDataAccessException) {
        return new TopicPartition(retryTopicName, r.partition());
      }
      else {
        return new TopicPartition(deadLetterTopicName, r.partition());
      }
    }
    );

    return recover;

  }

}
