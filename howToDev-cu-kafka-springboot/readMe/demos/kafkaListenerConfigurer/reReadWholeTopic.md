# Depends:
- mocks
- `howToDev-cu-kafka-springboot/springboot-kafka-consumer-non-cu-KafkaListenerConfigurer` for shortly `app`

# See
### Configuration
- `howToDev-cu-kafka-springboot/springboot-kafka-consumer-non-cu-KafkaListenerConfigurer/src/main/resources/data.sql`
- `com.example.springkafkaconsumerkafkalistenerconfigurer.factory.KafkaMessageListener.onPartitionsAssigned`
- `myAppSetting.kafka.consumer.klcN2.reset-offset`
- `myAppSetting.kafka.consumer.klcN2.reset-offset-tag`

# Action

### Manual test - reread from beginning

- trigger:
 - down mocks - `./mocks.bash down`
 - up mocks - `./mocks.bash up-no-recreate`
 - set `myAppSetting.kafka.consumer.klcN2.reset-offset=false`
   - setting previous execution or didn't
     - <b>variant 1</b> set `LAST_RESET_OFFSET_TAG` in `data.sql` to be smaller then to `myAppSetting.kafka.consumer.klcN2.reset-offset-tag`
     - <b>variant 2</b> comment all inserts
 - start `app`
 - send messages to `order-event-klc-n2-topic`
   - 3 x `./mocks.bash kafka producer order-event-klc-n2-topic kafkaFiles/order-event-normal.message`
   - `./mocks.bash kafka producer order-event-klc-n2-topic kafkaFiles/order-event-normal-123499normal-key.message`
   - `./mocks.bash kafka producer order-event-klc-n2-topic kafkaFiles/order-event-normal-12349normal-key.message`
   - `./mocks.bash kafka producer order-event-klc-n2-topic kafkaFiles/order-event-normal-1234normal-key.message`
- observe (make sure):
  - you have received message on more than one partition - `./mocks.bash kafka consumer-groups springboot-kafka-consumer-klc-n2-group-id`
  - count received message - `SELECT * FROM ORDER_ENTITY`
- trigger:
  - restart `app`
- observe:
  - so we use in memory db - no rows in `SELECT * FROM ORDER_ENTITY`
- trigger:
  - stop `app`
  - set `myAppSetting.kafka.consumer.klcN2.reset-offset=true`
  - set `myAppSetting.kafka.consumer.klcN2.reset-offset-tag=20230927`
  - start `app`
- observe
  - in `app` console that messages are received.
  - count received message - `SELECT * FROM ORDER_ENTITY`

### Manual test - reread from beginning validate once rereading
- trigger:
  - perform previous manual test but: 
    - change `LAST_RESET_OFFSET_TAG` in `data.sql` to be large or equal to `myAppSetting.kafka.consumer.klcN2.reset-offset-tag`
- observe:
  - no rereading

# Help
- DB - `http://localhost:8002/h2-console/`