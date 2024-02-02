package com.example.springkafkaconsumer.integration;

import static org.mockito.ArgumentMatchers.isA;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import com.example.springkafkaconsumer.consumer.OrderEventConsumerManualOffsetCommit_default;
import com.example.springkafkaconsumer.consumer.commonErrorHandler.OrderEventConsumerManualOffsetCommit_exponentialBackoff;
import com.example.springkafkaconsumer.consumer.commonErrorHandler.OrderEventConsumerManualOffsetCommit_notRetryableExceptions;
import com.example.springkafkaconsumer.consumer.commonErrorHandler.OrderEventConsumerManualOffsetCommit_retryListener;
import com.example.springkafkaconsumer.consumer.commonErrorHandler.OrderEventConsumerManualOffsetCommit_simpleErrorHandler;
import com.example.springkafkaconsumer.model.Order;
import com.example.springkafkaconsumer.model.OrderEventType;
import com.example.springkafkaconsumer.persistence.order.repository.OrderRepository;
import com.example.springkafkaconsumer.service.OrderService;
import com.example.springkafkaconsumer.util.Util;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.errors.UnknownTopicOrPartitionException;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.kafka.config.KafkaListenerEndpointRegistry;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.listener.MessageListenerContainer;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.test.EmbeddedKafkaBroker;
import org.springframework.kafka.test.context.EmbeddedKafka;
import org.springframework.kafka.test.utils.ContainerTestUtils;
import org.springframework.test.context.TestPropertySource;

//## ConsumerIntegrationTest
@SpringBootTest
@EmbeddedKafka(topics = "order-event-topic", partitions = 3)
@TestPropertySource(properties = {"spring.kafka.consumer.bootstrap-servers=${spring.embedded.kafka.brokers}",
    "spring.kafka.producer.bootstrap-servers=${spring.embedded.kafka.brokers}"})
public class CommonErrorHandlerIntegrationTest {

  @Value("${myAppSetting.kafka.topicSimpleErrorHandler.topicName}")
  private String topicSimpleErrorHandlerTopicName;
  @Value("${myAppSetting.kafka.topicSimpleErrorHandler.retry}")
  private int topicSimpleErrorHandlerRetry;

  @Value("${myAppSetting.kafka.topicRetryListener.topicName}")
  private String topicRetryListenerTopicName;
  @Value("${myAppSetting.kafka.topicRetryListener.retry}")
  private int topicRetryListenerRetry;

  @Value("${myAppSetting.kafka.topicNotRetryableExceptions.topicName}")
  private String topicNotRetryableExceptionsTopicName;
  @Value("${myAppSetting.kafka.topicNotRetryableExceptions.retry}")
  private int topicNotRetryableExceptionsRetry;

  @Value("${myAppSetting.kafka.topicExponentialBackoff.topicName}")
  private String topicExponentialBackoffTopicName;
  @Value("${myAppSetting.kafka.topicExponentialBackoff.maxRetries}")
  private int topicExponentialBackoffMaxRetries;


  @Autowired
  EmbeddedKafkaBroker embeddedKafkaBroker;

  @Autowired
  KafkaTemplate<String, String> kafkaTemplate;

  @Autowired
  KafkaListenerEndpointRegistry kafkaListenerEndpointRegistry;

  @Autowired
  Util util;

  @Autowired
  OrderRepository orderRepository;

  @SpyBean
  OrderEventConsumerManualOffsetCommit_default orderEventConsumerManualOffsetCommitSpy;

  @SpyBean
  OrderEventConsumerManualOffsetCommit_simpleErrorHandler orderEventConsumerManualOffsetCommit_simpleErrorHandlerSpy;

  @SpyBean
  OrderEventConsumerManualOffsetCommit_retryListener orderEventConsumerManualOffsetCommit_retryListenerSpy;

  @SpyBean
  OrderEventConsumerManualOffsetCommit_notRetryableExceptions orderEventConsumerManualOffsetCommit_notRetryableExceptionsSpy;

  @SpyBean
  OrderEventConsumerManualOffsetCommit_exponentialBackoff OrderEventConsumerManualOffsetCommit_exponentialBackoffSpy;

  @SpyBean
  OrderService orderServiceSpy;

  @Autowired
  private AdminClient adminClient;

  @BeforeEach
  void setUp() {

    for (MessageListenerContainer listenerContainer : kafkaListenerEndpointRegistry.getListenerContainers()) {
      //This make sure that all container are up and running.
      ContainerTestUtils.waitForAssignment(listenerContainer, embeddedKafkaBroker.getPartitionsPerTopic());
    }
    /**
     * If we have to wait for particular container use, because if some listener is annotated with autostart=false will be never
     ready (Assignment).
     * kafkaListenerEndpointRegistry.getListenerContainers().stream().filter(x -> x.getGroupId().equals("some-group-id"));
     */

  }

  @AfterEach
  void tearDown() {

    orderRepository.deleteAll();

    //Close producer
    DefaultKafkaProducerFactory defaultProducer = (DefaultKafkaProducerFactory) kafkaTemplate.getProducerFactory();
    defaultProducer.setPhysicalCloseTimeout(0);
    defaultProducer.destroy();

    //Delete topic
    try {
      adminClient.deleteTopics(List.of("order-event-topic")).all().get(60, TimeUnit.SECONDS);
    }
    catch (InterruptedException | TimeoutException e) {
      throw new RuntimeException(e);
    }
    catch (ExecutionException e) {
      if (!(e.getCause() instanceof UnknownTopicOrPartitionException)) {
        throw new RuntimeException(e);
      }
    }


  }

  @Test
  void givenOrderEventJson_whenSend_thenMessageIsReceived() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234";
    Order order = Order.builder().orderId(1).orderCode("orderCode1").build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    //when
    kafkaTemplate.send("order-event-topic", key, eventJson).get();//Wait to send

    Thread.sleep(3000L);

    //then
    verify(orderEventConsumerManualOffsetCommitSpy, times(1)).onMessage(isA(ConsumerRecord.class), isA(Acknowledgment.class));
    verify(orderServiceSpy, times(1)).processConsumerRecord(isA(ConsumerRecord.class));

  }

  @Test
  @Tag("TopicSimpleErrorHandler")
  void givenOrderCodeNull_whenSendTopicSimpleErrorHandler_thenMultipleTriesToReceived() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234";
    Order order = Order.builder().orderId(1).orderCode(null).build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    //when
    kafkaTemplate.send(topicSimpleErrorHandlerTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(6000L);

    //then
    verify(orderEventConsumerManualOffsetCommit_simpleErrorHandlerSpy, times(topicSimpleErrorHandlerRetry+1)).onMessage(isA(ConsumerRecord.class),
        isA(Acknowledgment.class));

  }

  @Test
  @Tag("TopicRetryListener")
  void givenOrderCodeNull_whenSendTopicRetryListener_thenMultipleTriesToReceived() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234";
    Order order = Order.builder().orderId(1).orderCode(null).build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    //when
    kafkaTemplate.send(topicRetryListenerTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(6000L);

    //then
    verify(orderEventConsumerManualOffsetCommit_retryListenerSpy, times(topicRetryListenerRetry+1)).onMessage(isA(ConsumerRecord.class),
        isA(Acknowledgment.class));

  }

  @Test
  @Tag("TopicNotRetryException")
  void givenOrderCodeNull_whenSendTopicNotRetryException_thenNoRetries() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234";
    Order order = Order.builder().orderId(1).orderCode(null).build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    //when
    kafkaTemplate.send(topicNotRetryableExceptionsTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(6000L);

    //then
    verify(orderEventConsumerManualOffsetCommit_notRetryableExceptionsSpy, times(1)).onMessage(isA(ConsumerRecord.class),
        isA(Acknowledgment.class));

  }

  @Test
  @Tag("TopicNotRetryException")
  void givenSimulateDBError_whenSendTopicNotRetryException_thenNoRetries() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234";
    Order order = Order.builder().orderId(6969).orderCode("order code 1").build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    //when
    kafkaTemplate.send(topicNotRetryableExceptionsTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(6000L);

    //then
    verify(orderEventConsumerManualOffsetCommit_notRetryableExceptionsSpy, times(topicNotRetryableExceptionsRetry+1)).onMessage(isA(ConsumerRecord.class),
        isA(Acknowledgment.class));

  }

  @Test
  @Tag("TopicExponentialBackoff")
  void givenSimulateDBError_whenSendTopicExponentialBackoff_Retries() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234";
    Order order = Order.builder().orderId(6969).orderCode("order code 1").build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    //when
    kafkaTemplate.send(topicExponentialBackoffTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(6000L);

    //then
    verify(OrderEventConsumerManualOffsetCommit_exponentialBackoffSpy, times(topicExponentialBackoffMaxRetries+1)).onMessage(isA(ConsumerRecord.class),
        isA(Acknowledgment.class));

  }

}
