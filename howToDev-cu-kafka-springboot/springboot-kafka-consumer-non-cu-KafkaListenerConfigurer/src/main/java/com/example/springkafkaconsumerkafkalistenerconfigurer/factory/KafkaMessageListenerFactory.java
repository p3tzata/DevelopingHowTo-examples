package com.example.springkafkaconsumerkafkalistenerconfigurer.factory;

import com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.KafkaMessageProcessor;
import com.example.springkafkaconsumerkafkalistenerconfigurer.kafkaMessageProcessor.KafkaMessageProcessorCollection;
import com.example.springkafkaconsumerkafkalistenerconfigurer.properties.KafkaConsumerProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class KafkaMessageListenerFactory {

  private KafkaMessageProcessorCollection kafkaMessageProcessorCollection;

  @Autowired
  public KafkaMessageListenerFactory(KafkaMessageProcessorCollection kafkaMessageProcessorCollection) {

    this.kafkaMessageProcessorCollection = kafkaMessageProcessorCollection;
  }

  public KafkaMessageListener getMessageListener(KafkaConsumerProperties properties) {

    KafkaMessageProcessor kafkaMessageProcessor = kafkaMessageProcessorCollection.getKafkaMessageProcessor(
        properties.getTopicName());

    return new KafkaMessageListener(kafkaMessageProcessor);

  }


}
