package com.example.springkafkaconsumer.integration;

import static org.mockito.ArgumentMatchers.isA;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import com.example.springkafkaconsumer.consumer.OrderEventConsumerManualOffsetCommit_default;
import com.example.springkafkaconsumer.model.Order;
import com.example.springkafkaconsumer.model.OrderEventType;
import com.example.springkafkaconsumer.persistence.order.repository.OrderRepository;
import com.example.springkafkaconsumer.service.OrderService;
import com.example.springkafkaconsumer.util.Util;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.concurrent.ExecutionException;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.kafka.config.KafkaListenerEndpointRegistry;
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
public class ConsumerIntegrationTest {

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
  OrderService orderServiceSpy;

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



}
