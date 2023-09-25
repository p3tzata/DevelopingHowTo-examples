package com.example.springkafkaconsumerkafkalistenerconfigurer.properties;

import java.util.Map;
import lombok.AllArgsConstructor;
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

}
