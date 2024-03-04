package com.example.springtracermicrometerkafkaconsumer.kafka.factory;

import com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor.MyKafkaMessageProcessor;
import com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor.KafkaMessageProcessorCollection;
import com.example.springtracermicrometerkafkaconsumer.kafka.properties.KafkaConsumerProperties;
import com.example.springtracermicrometerkafkaconsumer.kafka.service.ResetOffsetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class KafkaMessageListenerFactory {

  private KafkaMessageProcessorCollection kafkaMessageProcessorCollection;
  private ResetOffsetService resetOffsetService;

  @Autowired
  public KafkaMessageListenerFactory(KafkaMessageProcessorCollection kafkaMessageProcessorCollection,
      ResetOffsetService resetOffsetService) {

    this.kafkaMessageProcessorCollection = kafkaMessageProcessorCollection;
    this.resetOffsetService = resetOffsetService;
  }

  public KafkaMessageListener getMessageListener(KafkaConsumerProperties properties) {

    MyKafkaMessageProcessor myKafkaMessageProcessor = kafkaMessageProcessorCollection.getKafkaMessageProcessor(
        properties.getTopicName());

    return new KafkaMessageListener(myKafkaMessageProcessor, resetOffsetService, properties);

  }


}
