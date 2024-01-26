package com.example.springtracermicrometerkafkaconsumer.kafka.properties;

import java.util.Map;
import java.util.Objects;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "my-app-setting.kafka")
@Data
@NoArgsConstructor
public class KafkaConsumerApplicationProperties {

  private Map<String, KafkaConsumerProperties> consumer;

  public KafkaConsumerProperties getProperties(String topic) {

    return consumer.entrySet().stream().filter(entry -> Objects.equals(entry.getValue().getTopicName(), topic))
        .map(entry -> entry.getValue())
        .findFirst().orElse(null);
  }
}
