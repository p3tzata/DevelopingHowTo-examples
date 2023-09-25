package com.example.springkafkaconsumerkafkalistenerconfigurer.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KafkaConsumerProperties {

  private String topicName;
  private String groupId;
  private int concurrency;
  private int numRetry;
  private long waitBetweenRetriesMs;
  private String autoOffsetResetConfig;

}
