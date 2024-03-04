package com.example.springtracermicrometerkafkaconsumer.kafka.kafkaMessageProcessor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class KafkaMessageProcessorCollection {

  private List<MyKafkaMessageProcessor> myKafkaMessageProcessorList;
  private Map<String, MyKafkaMessageProcessor> kafkaMessageProcessorMap = new HashMap<>();

  @Autowired
  public KafkaMessageProcessorCollection(List<MyKafkaMessageProcessor> myKafkaMessageProcessorList) {

    this.myKafkaMessageProcessorList = myKafkaMessageProcessorList;

    seed();
  }

  private void seed() {

    myKafkaMessageProcessorList.stream().forEach(x -> kafkaMessageProcessorMap.put(x.getTopicName(), x));
  }

  public MyKafkaMessageProcessor getKafkaMessageProcessor(String topicName) {

    return kafkaMessageProcessorMap.get(topicName);
  }


}
