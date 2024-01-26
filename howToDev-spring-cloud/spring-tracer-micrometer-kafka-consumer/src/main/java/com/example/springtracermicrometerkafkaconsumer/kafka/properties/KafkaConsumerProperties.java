package com.example.springtracermicrometerkafkaconsumer.kafka.properties;

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
  private boolean resetOffset;
  /**
   *<pre>
   *   Suggest to use dateFormat('YYYYMMDD').N, to avoid resetting(rereading) in unexpected app restart or double rereading.
   *   i.e. 20230927 or 20230927.1,20230927.2 if you need two or more resetOffset in one day.
   *</pre>
   */
  private double resetOffsetTag;

}
