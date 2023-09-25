package com.example.springkafkaconsumerkafkalistenerconfigurer.config;

import com.example.springkafkaconsumerkafkalistenerconfigurer.factory.KafkaMessageListenerFactory;
import com.example.springkafkaconsumerkafkalistenerconfigurer.factory.KafkaMessageListener;
import com.example.springkafkaconsumerkafkalistenerconfigurer.properties.KafkaConsumerApplicationProperties;
import com.example.springkafkaconsumerkafkalistenerconfigurer.properties.KafkaConsumerProperties;
import java.lang.reflect.Method;
import java.sql.SQLTransientConnectionException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.function.Predicate;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.hibernate.exception.JDBCConnectionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListenerConfigurer;
import org.springframework.kafka.config.KafkaListenerEndpoint;
import org.springframework.kafka.config.KafkaListenerEndpointRegistrar;
import org.springframework.kafka.config.MethodKafkaListenerEndpoint;
import org.springframework.kafka.listener.ListenerExecutionFailedException;
import org.springframework.kafka.listener.adapter.RetryingMessageListenerAdapter;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.messaging.handler.annotation.support.DefaultMessageHandlerMethodFactory;
import org.springframework.retry.RecoveryCallback;
import org.springframework.retry.RetryContext;
import org.springframework.retry.backoff.BackOffPolicy;
import org.springframework.retry.backoff.FixedBackOffPolicy;
import org.springframework.retry.policy.SimpleRetryPolicy;
import org.springframework.retry.support.RetryTemplate;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class KafkaListenerConfigurerConfig implements KafkaListenerConfigurer {

  private KafkaConsumerApplicationProperties kafkaConsumerApplicationProperties;
  private KafkaMessageListenerFactory kafkaListenerContainerFactory;

  @Autowired
  public KafkaListenerConfigurerConfig(KafkaConsumerApplicationProperties kafkaConsumerApplicationProperties,
      KafkaMessageListenerFactory kafkaListenerContainerFactory) {

    this.kafkaConsumerApplicationProperties = kafkaConsumerApplicationProperties;
    this.kafkaListenerContainerFactory = kafkaListenerContainerFactory;
  }

  @Override
  public void configureKafkaListeners(KafkaListenerEndpointRegistrar registrar) {

    kafkaConsumerApplicationProperties.getConsumer().entrySet().stream().map(x -> getEndPoint(x.getValue()))
        .forEach(registrar::registerEndpoint);
  }

  public <T> KafkaListenerEndpoint getEndPoint(KafkaConsumerProperties properties) {

    //## Create MethodKafkaListenerEndpoint.
    MethodKafkaListenerEndpoint<String, String> endpoint = new MethodKafkaListenerEndpoint<>();

    KafkaMessageListener messageListener = kafkaListenerContainerFactory.getMessageListener(properties);

    Properties consumerProps = new Properties();

    //Read ConsumerConfig.AUTO_OFFSET_RESET_DOC -i.e.  What to do on first start of this consumer-group-id
    consumerProps.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, properties.getAutoOffsetResetConfig());


    endpoint.setId(properties.getTopicName() + "-end-point-id");
    endpoint.setGroupId(properties.getGroupId());
    endpoint.setConsumerProperties(consumerProps);
    endpoint.setAutoStartup(true);
    endpoint.setTopics(properties.getTopicName());
    endpoint.setMessageHandlerMethodFactory(new DefaultMessageHandlerMethodFactory());
    endpoint.setBean(messageListener);
    endpoint.setMethod(getListenerMethod());
    endpoint.setConcurrency(properties.getConcurrency());
    endpoint.setRetryTemplate(retryTemplate(properties));
    endpoint.setRecoveryCallback(recoveryCallback());
    // I don't know what this is needed for.
    // endpoint.setBeanFactory(beanFactory);

    return endpoint;
  }

  private Method getListenerMethod() {

    try {

      return KafkaMessageListener.class.getMethod("onMessage", ConsumerRecord.class, Acknowledgment.class);

    }
    catch (NoSuchMethodException e) {

      throw new IllegalStateException("Couldn't find the method", e);
    }
  }

  private RetryTemplate retryTemplate(KafkaConsumerProperties properties) {

    final RetryTemplate retryTemplate = new RetryTemplate();
    retryTemplate.setRetryPolicy(new SimpleRetryPolicy(properties.getNumRetry(),
        Collections.singletonMap(ListenerExecutionFailedException.class, Boolean.TRUE)));
    retryTemplate.setBackOffPolicy(backOffPolicy(properties));
    retryTemplate.setThrowLastExceptionOnExhausted(true);
    return retryTemplate;
  }

  private BackOffPolicy backOffPolicy(KafkaConsumerProperties properties) {

    final FixedBackOffPolicy fixedBackOffPolicy = new FixedBackOffPolicy();
    fixedBackOffPolicy.setBackOffPeriod(properties.getWaitBetweenRetriesMs());
    return fixedBackOffPolicy;
  }


  private RecoveryCallback recoveryCallback() {

    RecoveryCallback recoveryCallback = new RecoveryCallback() {
      @Override
      public Object recover(RetryContext retryContext) throws Exception {

        Acknowledgment ack = (Acknowledgment) retryContext.getAttribute(RetryingMessageListenerAdapter.CONTEXT_ACKNOWLEDGMENT);
        ConsumerRecord record = (ConsumerRecord) retryContext.getAttribute(RetryingMessageListenerAdapter.CONTEXT_RECORD);

        //May filter by retryContext.getLastThrowable(), only for particular Exception to by pass tish acknowledge.

        ack.acknowledge();
        log.error("Trying to acknowledge after all tries are exhausted. Error while processing: " + record.toString(),
            retryContext.getLastThrowable());

        return null;
      }

    };

    return recoveryCallback;
  }


}
