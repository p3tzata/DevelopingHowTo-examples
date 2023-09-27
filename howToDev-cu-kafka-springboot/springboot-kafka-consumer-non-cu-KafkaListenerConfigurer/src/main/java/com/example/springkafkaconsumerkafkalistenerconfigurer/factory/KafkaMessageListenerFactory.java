package com.example.springkafkaconsumerkafkalistenerconfigurer.factory;

import com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.KafkaMessageProcessor;
import com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.KafkaMessageProcessorCollection;
import com.example.springkafkaconsumerkafkalistenerconfigurer.properties.KafkaConsumerProperties;
import com.example.springkafkaconsumerkafkalistenerconfigurer.service.ResetOffsetService;
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

    KafkaMessageProcessor kafkaMessageProcessor = kafkaMessageProcessorCollection.getKafkaMessageProcessor(
        properties.getTopicName());

    return new KafkaMessageListener(kafkaMessageProcessor, resetOffsetService, properties);

  }


}
