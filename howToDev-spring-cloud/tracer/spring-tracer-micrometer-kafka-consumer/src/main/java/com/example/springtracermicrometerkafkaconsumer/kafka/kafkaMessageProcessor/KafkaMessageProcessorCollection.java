package com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class KafkaMessageProcessorCollection {

  private List<KafkaMessageProcessor> kafkaMessageProcessorList;
  private Map<String, KafkaMessageProcessor> kafkaMessageProcessorMap = new HashMap<>();

  @Autowired
  public KafkaMessageProcessorCollection(List<KafkaMessageProcessor> kafkaMessageProcessorList) {

    this.kafkaMessageProcessorList = kafkaMessageProcessorList;

    seed();
  }

  private void seed() {

    kafkaMessageProcessorList.stream().forEach(x -> kafkaMessageProcessorMap.put(x.getTopicName(), x));
  }

  public KafkaMessageProcessor getKafkaMessageProcessor(String topicName) {

    return kafkaMessageProcessorMap.get(topicName);
  }


}
