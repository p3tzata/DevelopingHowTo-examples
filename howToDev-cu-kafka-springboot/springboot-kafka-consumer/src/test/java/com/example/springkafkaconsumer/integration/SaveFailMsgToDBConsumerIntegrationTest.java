package com.example.springkafkaconsumer.integration;

import static org.mockito.ArgumentMatchers.isA;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import com.example.springkafkaconsumer.consumer.commonErrorHandler.OrderEventConsumerManualOffsetCommit_simpleErrorHandler;
import com.example.springkafkaconsumer.consumer.recovery.OrderEventConsumerManualOffsetCommit_recover;
import com.example.springkafkaconsumer.consumer.savaFailMsgToDB.OrderEventConsumerManualOffsetCommit_saveFailMsgToDB;
import com.example.springkafkaconsumer.model.Order;
import com.example.springkafkaconsumer.model.OrderEventType;
import com.example.springkafkaconsumer.persistence.failRecord.FailRecordRepository;
import com.example.springkafkaconsumer.persistence.order.repository.OrderRepository;
import com.example.springkafkaconsumer.service.FailRecordService;
import com.example.springkafkaconsumer.service.OrderService;
import com.example.springkafkaconsumer.util.Util;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.Consumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.kafka.config.KafkaListenerEndpointRegistry;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.listener.MessageListenerContainer;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.test.EmbeddedKafkaBroker;
import org.springframework.kafka.test.context.EmbeddedKafka;
import org.springframework.kafka.test.utils.ContainerTestUtils;
import org.springframework.kafka.test.utils.KafkaTestUtils;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.TestPropertySource;

//## RecoverConsumerIntegrationTest
@Slf4j
@SpringBootTest
@DirtiesContext
@EmbeddedKafka(topics = {
    "${myAppSetting.kafka.topicSaveFailMsgToDB.topicName}"
}, partitions = 3)
@TestPropertySource(properties = {"spring.kafka.consumer.bootstrap-servers=${spring.embedded.kafka.brokers}",
    "spring.kafka.producer.bootstrap-servers=${spring.embedded.kafka.brokers}"})
public class SaveFailMsgToDBConsumerIntegrationTest {


  @Value("${myAppSetting.kafka.topicSaveFailMsgToDB.topicName}")
  private String saveFailMsgToDBTopicName;
  @Value("${myAppSetting.kafka.topicRecover.normal.retry}")
  private int retry;

  @Autowired
  EmbeddedKafkaBroker embeddedKafkaBroker;

  @Autowired
  KafkaTemplate<String, String> kafkaTemplate;

  private Consumer<String, String> consumer;

  @Autowired
  KafkaListenerEndpointRegistry kafkaListenerEndpointRegistry;

  @Autowired
  Util util;

  @Autowired
  OrderRepository orderRepository;

  @Autowired
  FailRecordRepository failRecordRepository;

  @SpyBean
  OrderEventConsumerManualOffsetCommit_saveFailMsgToDB orderEventConsumerManualOffsetCommit_saveFailMsgToDB;

  @SpyBean
  OrderService orderServiceSpy;


  @BeforeEach
  void setUp() {

    for (MessageListenerContainer listenerContainer : kafkaListenerEndpointRegistry.getListenerContainers()) {
      //This make sure that all container are up and running.
      ContainerTestUtils.waitForAssignment(listenerContainer, embeddedKafkaBroker.getPartitionsPerTopic());
    }

    //
    // If we have to wait for particular container use, because if some listener is annotated with autostart=false will be never
    // ready (Assignment).
    // kafkaListenerEndpointRegistry.getListenerContainers().stream().filter(x -> x.getGroupId().equals("some-group-id"));
    //

  }


  @AfterEach
  void tearDown() {

    orderRepository.deleteAll();
    failRecordRepository.deleteAll();
    consumer.close();
    //Close producer
    DefaultKafkaProducerFactory defaultProducer = (DefaultKafkaProducerFactory) kafkaTemplate.getProducerFactory();
    defaultProducer.setPhysicalCloseTimeout(0);
    defaultProducer.destroy();
  }

  @Test
  void givenHappyPath_whenSend_thenMessageIsReceived() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given

    String key = "1234-happyPath";
    Order order = Order.builder().orderId(1).orderCode("order code").build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    Map<String, Object> configs = new HashMap<>(KafkaTestUtils.consumerProps("group1", "true", embeddedKafkaBroker));
    configs.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "latest");
    consumer = new DefaultKafkaConsumerFactory<>(configs, new StringDeserializer(), new StringDeserializer()).createConsumer();
    embeddedKafkaBroker.consumeFromAnEmbeddedTopic(consumer, saveFailMsgToDBTopicName);
    consumer.poll(1000L);

    //when
    kafkaTemplate.send(saveFailMsgToDBTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(3000L);

    //then
    verify(orderEventConsumerManualOffsetCommit_saveFailMsgToDB, times(1)).onMessage(isA(ConsumerRecord.class),
        isA(Acknowledgment.class));
    verify(orderServiceSpy, times(1)).processConsumerRecord(isA(ConsumerRecord.class));

    ConsumerRecords<String, String> records = KafkaTestUtils.getRecords(consumer, 2000L);
    Assertions.assertThat(records.records(saveFailMsgToDBTopicName))
        .hasSize(1)
        .satisfiesExactlyInAnyOrder(item -> {
          Assertions.assertThat(item.key()).isEqualTo(key);
        });

  }

  @Test
  void givenSimulateDBError_whenSend_thenPublishToRetryTopic() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given
    String key = "1234-dbError";
    Order order = Order.builder().orderId(6969).orderCode("order code").build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);

    Map<String, Object> configs = new HashMap<>(KafkaTestUtils.consumerProps("group2", "true", embeddedKafkaBroker));
    configs.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "latest");
    consumer = new DefaultKafkaConsumerFactory<>(configs, new StringDeserializer(), new StringDeserializer()).createConsumer();
    embeddedKafkaBroker.consumeFromAnEmbeddedTopic(consumer, saveFailMsgToDBTopicName);
    consumer.poll(1000L);

    //when
    kafkaTemplate.send(saveFailMsgToDBTopicName, key, eventJson).get();//Wait to send

    Thread.sleep(10000L);

    ConsumerRecords<String, String> records = KafkaTestUtils.getRecords(consumer, 2000L);
    Assertions.assertThat(records.records(saveFailMsgToDBTopicName))
        .hasSize(1)
        .satisfiesExactlyInAnyOrder(item -> {
          Assertions.assertThat(item.key()).isEqualTo(key);
        });

    Assertions.assertThat(failRecordRepository.findAll())
        .hasSize(1)
        .satisfiesExactly(item -> {
          Assertions.assertThat(item.getKeyOfRecord()).isEqualTo(key);
          Assertions.assertThat(item.getStatus()).isEqualTo("RETRY");
        });

  }

  @Test
  void givenSimulateFatalError_whenSend_thenPublishToDeadLetterTopic() throws JsonProcessingException, ExecutionException,
      InterruptedException {

    //given

    String key = "1234-fatalError";
    Order order = Order.builder().orderId(1).orderCode(null).build();

    String eventJson = util.buildEventJson(key, OrderEventType.create, order);
    Map<String, Object> configs = new HashMap<>(KafkaTestUtils.consumerProps("group3", "true", embeddedKafkaBroker));
    configs.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "latest");
    consumer = new DefaultKafkaConsumerFactory<>(configs, new StringDeserializer(), new StringDeserializer()).createConsumer();
    embeddedKafkaBroker.consumeFromAnEmbeddedTopic(consumer, saveFailMsgToDBTopicName);
    consumer.poll(1000L);

    //when
    kafkaTemplate.send(saveFailMsgToDBTopicName, key, eventJson).get();//Wait to send
    Thread.sleep(10000L);

    ConsumerRecords<String, String> records = KafkaTestUtils.getRecords(consumer, 2000L);
    Assertions.assertThat(records.records(saveFailMsgToDBTopicName))
        .hasSize(1)
        .satisfiesExactlyInAnyOrder(item -> {
          Assertions.assertThat(item.key()).isEqualTo(key);
        });

    Assertions.assertThat(failRecordRepository.findAll())
        .hasSize(1)
        .satisfiesExactly(item -> {
          Assertions.assertThat(item.getKeyOfRecord()).isEqualTo(key);
          Assertions.assertThat(item.getStatus()).isEqualTo("DEAD");
        });

  }


}
