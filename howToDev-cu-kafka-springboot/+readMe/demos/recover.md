### See configuration
- `com/example/springkafkaconsumer/config/recovery/KafkaListenerContainerFactory_recoveryConfiguration.java`
- `com/example/springkafkaconsumer/consumer/recovery/OrderEventConsumerManualOffsetCommit_recover.java`
 
### See integration test
- `com/example/springkafkaconsumer/integration/RecoverConsumerIntegrationTest.java`

### Observe
- Publish to `order-event-normal-topic-RETRY` if we have specific exception `RecoverableDataAccessException`
  - in real production we have to have some consumer to read and retry messages from this topic.
  - message sent in this topic have additional headers (because of DeadLetterPublishingRecoverer) like `kafka_dtl_*` where we can 
    get some info.
- Publish to `order-event-normal-topic-DLT` if we 