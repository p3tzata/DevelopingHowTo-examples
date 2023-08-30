package com.example.springkafkaconsumer.config.savaFailMsgToDB;

import com.example.springkafkaconsumer.service.FailRecordService;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
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
import org.springframework.kafka.listener.ConsumerRecordRecoverer;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.util.backoff.FixedBackOff;

@Configuration
@Slf4j
public class KafkaListenerContainerFactory_saveFailMsgToDBConfiguration {

  private KafkaProperties kafkaProperties;
  private FailRecordService failRecordService;

  KafkaListenerContainerFactory_saveFailMsgToDBConfiguration(KafkaProperties kafkaProperties, FailRecordService failRecordService) {

    this.kafkaProperties = kafkaProperties;
    this.failRecordService = failRecordService;
  }


  @Value("${myAppSetting.kafka.topicRecover.normal.retry}")
  private long retry;

  @Value("${myAppSetting.kafka.topicRecover.normal.intervalRetry}")
  private long intervalRetry;

  @Bean(name = "KafkaListenerContainerFactory_saveFailMsgToDB")
  ConcurrentKafkaListenerContainerFactory<?, ?> kafkaListenerContainerFactory(
      ConcurrentKafkaListenerContainerFactoryConfigurer configurer,
      ObjectProvider<ConsumerFactory<Object, Object>> kafkaConsumerFactory) {

    ConcurrentKafkaListenerContainerFactory<Object, Object> factory = new ConcurrentKafkaListenerContainerFactory<>();
    configurer.configure(factory, kafkaConsumerFactory
        .getIfAvailable(() -> new DefaultKafkaConsumerFactory<>(this.kafkaProperties.buildConsumerProperties())));
    factory.setConcurrency(3);
    factory.setCommonErrorHandler(saveToDBErrorHandler());
    return factory;
  }

  public DefaultErrorHandler saveToDBErrorHandler() {

    var fixedBackOff = new FixedBackOff(intervalRetry, retry);

    var defaultErrorHandler = new DefaultErrorHandler(consumerRecordRecoverer(), fixedBackOff);

    return defaultErrorHandler;
  }

  private ConsumerRecordRecoverer consumerRecordRecoverer() {

    return (consumerRecord, e) -> {
      log.error("Exception in consumerRecordRecoverer : {} ", e.getMessage(), e);

      ConsumerRecord<String, String> record = (ConsumerRecord<String, String>) consumerRecord;

      if (e.getCause() instanceof RecoverableDataAccessException) {
        //recover logic.
        failRecordService.saveFailRecord(record, e, "RETRY");
      }
      else {
        //non-recover logic.
        failRecordService.saveFailRecord(record, e, "DEAD");
      }
    };
  }


}
