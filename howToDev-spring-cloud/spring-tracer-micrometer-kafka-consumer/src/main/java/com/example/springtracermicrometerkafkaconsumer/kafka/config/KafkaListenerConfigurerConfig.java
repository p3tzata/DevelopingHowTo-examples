package com.example.springtracermicrometerkafkaconsumer.kafka.config;

import com.example.springtracermicrometerkafkaconsumer.kafka.factory.KafkaMessageListener;
import com.example.springtracermicrometerkafkaconsumer.kafka.factory.KafkaMessageListenerFactory;
import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerApplicationProperties;
import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerProperties;
import java.lang.reflect.Method;
import java.util.Properties;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListenerConfigurer;
import org.springframework.kafka.config.KafkaListenerEndpoint;
import org.springframework.kafka.config.KafkaListenerEndpointRegistrar;
import org.springframework.kafka.config.MethodKafkaListenerEndpoint;
import org.springframework.kafka.listener.DefaultErrorHandler;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.messaging.handler.annotation.support.DefaultMessageHandlerMethodFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.backoff.FixedBackOff;

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


    // delete due new version endpoint.setRetryTemplate(retryTemplate(properties));
    // delete due new version endpoint.setRecoveryCallback(recoveryCallback());

    // I don't know what this is needed for.
    // endpoint.setBeanFactory(beanFactory);

    return endpoint;
  }

  private DefaultErrorHandler getErrorHandler(KafkaConsumerProperties properties) {

    DefaultErrorHandler handler = new DefaultErrorHandler(
        new FixedBackOff(properties.getWaitBetweenRetriesMs(), properties.getNumRetry()));
    //handler.setBackOffFunction(this::getErrorHandlerBackOff);
    return handler;
  }



  private Method getListenerMethod() {

    try {

      return KafkaMessageListener.class.getMethod("onMessage", ConsumerRecord.class, Acknowledgment.class);

    }
    catch (NoSuchMethodException e) {

      throw new IllegalStateException("Couldn't find the method", e);
    }
  }

  /*
  private RetryTemplate retryTemplate(KafkaConsumerProperties properties) {

    final RetryTemplate retryTemplate = new RetryTemplate();
    retryTemplate.setRetryPolicy(new SimpleRetryPolicy(properties.getNumRetry(),
        Collections.singletonMap(ListenerExecutionFailedException.class, Boolean.TRUE)));
    retryTemplate.setBackOffPolicy(backOffPolicy(properties));
    retryTemplate.setThrowLastExceptionOnExhausted(true);
    return retryTemplate;
  }
  */
/*
  private BackOffPolicy backOffPolicy(KafkaConsumerProperties properties) {

    final FixedBackOffPolicy fixedBackOffPolicy = new FixedBackOffPolicy();
    fixedBackOffPolicy.setBackOffPeriod(properties.getWaitBetweenRetriesMs());
    return fixedBackOffPolicy;
  }
*/
/*
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
*/

}
