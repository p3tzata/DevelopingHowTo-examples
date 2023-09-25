# Depends:
- mocks
- `springboot-kafka-consumer-non-cu-KafkaListenerConfigurer`

# See
### Configuration
- `com.example.springkafkaconsumerkafkalistenerconfigurer.config.KafkaListenerConfigurerConfig.retryTemplate`
- `com.example.springkafkaconsumerkafkalistenerconfigurer.config.KafkaListenerConfigurerConfig.recoveryCallback`


### Manual test - RetryAndAcknowledgeAfterExhausted

- trigger:
  - `./mocks.bash kafka producer order-event-klc-n2-topic kafkaFiles/order-event-simulateFatalError.message`
- observe:
  - In console:
    ```
    Receiving message, topic:order-event-klc-n2-topic, key:1234simulateFatalError-key
    Receiving message, topic:order-event-klc-n2-topic, key:1234simulateFatalError-key
    ...
    Trying to acknowledge after all tries are exhausted. Error while processing: ConsumerRecord
     ```


# Help
- DB - `http://localhost:XXXX/h2-console/`