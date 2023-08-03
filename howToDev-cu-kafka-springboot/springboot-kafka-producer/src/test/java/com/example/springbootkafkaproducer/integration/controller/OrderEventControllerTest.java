package com.example.springbootkafkaproducer.integration.controller;

import com.example.springbootkafkaproducer.integration.util.Util;
import com.example.springbootkafkaproducer.model.Event;
import com.example.springbootkafkaproducer.model.Order;
import com.example.springbootkafkaproducer.model.OrderEventType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Map;
import org.apache.catalina.filters.AddDefaultCharsetFilter.ResponseWrapper;
import org.apache.kafka.clients.consumer.Consumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.ResolvableType;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.test.EmbeddedKafkaBroker;
import org.springframework.kafka.test.context.EmbeddedKafka;
import org.springframework.kafka.test.utils.KafkaTestUtils;
import org.springframework.test.context.TestPropertySource;

/**
 * ## OrderEventControllerTest - integration test.
 * - without TestPropertySource message goes on brokers defined in application.yml that is bad.
 */


@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@EmbeddedKafka(topics = "order-event-topic")
@TestPropertySource(properties = {"spring.kafka.producer.bootstrap-servers=${spring.embedded.kafka.brokers}",
    "spring.kafka.admin.properties.bootstrap.servers=${spring.embedded.kafka.brokers}"})
class OrderEventControllerTest {

  @Autowired
  private TestRestTemplate restTemplate;

  @Autowired
  private EmbeddedKafkaBroker embeddedKafkaBroker;

  private Consumer<String, String> consumer;

  @BeforeEach
  void setUp() {

    Map<String, Object> consumerProps = KafkaTestUtils.consumerProps("my-unit-test-group-id", "true", embeddedKafkaBroker);
    consumerProps.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "latest");
    consumer = new DefaultKafkaConsumerFactory<String, String>(consumerProps, new StringDeserializer(), new StringDeserializer())
        .createConsumer();

    embeddedKafkaBroker.consumeFromAllEmbeddedTopics(consumer);

  }

  @AfterEach
  void tearDown() {

    consumer.close();

  }

  @Test
  void postEvent_sendEvent() {

    //given
    HttpHeaders httpHeaders = new HttpHeaders();
    httpHeaders.set("content-type", MediaType.APPLICATION_JSON.toString());

    Event<OrderEventType, Order> orderEvent = Util.buildEvent("12348", OrderEventType.create,
        Order.builder().orderId(123).orderCode("unitTestOrderCode").build());
    HttpEntity<Event<OrderEventType, Order>> eventHttpEntity = new HttpEntity<>(orderEvent);

    //when
    ResponseEntity<Object> exchange = restTemplate.exchange("/order/v1/event", HttpMethod.POST, eventHttpEntity, Object.class);

    //then
    Assertions.assertThat(exchange.getStatusCode()).isEqualTo(HttpStatus.CREATED);

    ConsumerRecords<String, String> records = KafkaTestUtils.getRecords(consumer);

    Assertions.assertThat(records)
        .hasSize(1)
        .satisfiesExactlyInAnyOrder(item -> {
          Assertions.assertThat(item.key()).isEqualTo("12348");
        });

  }

}

