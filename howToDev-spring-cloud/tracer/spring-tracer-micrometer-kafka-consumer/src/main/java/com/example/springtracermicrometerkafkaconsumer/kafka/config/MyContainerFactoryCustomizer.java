package com.example.springtracermicrometerkafkaconsumer.kafka.config;

import com.example.springtracermicrometerkafkaconsumer.kafka.exception.UnrecoverableBackoffException;
import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerApplicationProperties;
import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerProperties;
import java.sql.SQLTransientConnectionException;
import java.time.Duration;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.function.Predicate;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.hibernate.exception.JDBCConnectionException;
import org.springframework.kafka.config.AbstractKafkaListenerContainerFactory;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.util.backoff.BackOff;
import org.springframework.util.backoff.FixedBackOff;

@Slf4j
public class MyContainerFactoryCustomizer {

  private KafkaConsumerApplicationProperties kafkaConsumerApplicationProperties;

  public MyContainerFactoryCustomizer(
      AbstractKafkaListenerContainerFactory<?, ?, ?> factory,
      int authExceptionRetryInterval,
      KafkaConsumerApplicationProperties kafkaConsumerApplicationProperties) {

    this.kafkaConsumerApplicationProperties = kafkaConsumerApplicationProperties;

    factory.setContainerCustomizer(
        container -> {
          container.getContainerProperties().setAuthExceptionRetryInterval(Duration.ofMillis(authExceptionRetryInterval));

          //readMe: Enable Consumer TraceId and SpanId in log.
          container.getContainerProperties().setObservationEnabled(true);

          String[] containerTopics = container.getContainerProperties().getTopics();
          if (containerTopics.length != 1) {
            throw new IllegalStateException(
                "Container properties should have exactly one topic. Instead these are the topics: " + String.join(",",
                    containerTopics));
          }

          String topic = containerTopics[0];
          KafkaConsumerProperties properties = kafkaConsumerApplicationProperties.getProperties(topic);
          DefaultErrorHandler handler = new DefaultErrorHandler(
              new FixedBackOff(properties.getWaitBetweenRetriesMs(), properties.getNumRetry()));

          handler.setBackOffFunction(this::getErrorHandlerBackOff);

          //handler.addNotRetryableExceptions(IllegalArgumentException.class);
          //handler.addRetryableExceptions();

          container.setCommonErrorHandler(handler);

        });

  }

  private BackOff getErrorHandlerBackOff(ConsumerRecord<?, ?> record, Exception exception) {


    if (exception instanceof IllegalStateException) {
      log.error("IllegalStateException is present. Infinity retrying record: " + record.toString());
      throw new UnrecoverableBackoffException(exception);
    }
    else {
      // This should use the configured FixedBackOff in DefaultErrorHandler
      return null;
    }
  }

}
