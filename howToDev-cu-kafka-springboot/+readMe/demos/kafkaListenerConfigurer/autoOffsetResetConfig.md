# Depends:
- mocks
- `howToDev-cu-kafka-springboot/springboot-kafka-consumer-non-cu-KafkaListenerConfigurer` for shortly `app`

# See
### Configuration
- `com.example.springkafkaconsumerkafkalistenerconfigurer.config.KafkaListenerConfigurerConfig.getEndPoint`
  - `org.springframework.kafka.config.AbstractKafkaListenerEndpoint.setConsumerProperties`
- `myAppSetting.kafka.consumer.klcN1.auto-offset-reset-config=earliest`
- `myAppSetting.kafka.consumer.klcN2.auto-offset-reset-config=latest`

# Action

### Manual test - Auto Offset Reset Config - <i> Mainly this is applicable for new customer id to read topic from beginning or only message after consumer is started </i>

- trigger:
  - delete old message - `./mocks.bash kafka delete kafkaFiles/delete-records.json`
  - start `app` 
  - send 3 normal messages to `order-event-klc-n1-topic` and `order-event-klc-n2-topic` (i.e. `./mocks.bash kafka 
    producer order-event-klc-n1-topic kafkaFiles/order-event-normal.message`)
- observe (make sure):
  - in the console you have to see 6 times - `Processed order event: ...`
  - in h2 db - `SELECT * FROM ORDER_ENTITY` you have to see 6 messages.
- trigger:
  - restart the `app`
- observe (make sure)
  - in console: no new message.
- trigger:
  - Change `myAppSetting.kafka.consumer.klcN1.group-id=springboot-kafka-consumer-klc-n1-25092023-group-id` 
  - Change `myAppSetting.kafka.consumer.klcN2.group-id=springboot-kafka-consumer-klc-n1-25092023-group-id`
  - restart `app`
- observe 
  - only `order-event-klc-n1-topic` is READ AGAIN
    - in the console you have to see 3 times`Processed order event: ...`
    - in h2 db - `SELECT * FROM ORDER_ENTITY` you have to see 3 messages.

# Help
- DB - `http://localhost:8002/h2-console/`