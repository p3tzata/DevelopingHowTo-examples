# See
### See configuration

- `com/example/springkafkaconsumer/config/savaFailMsgToDB/KafkaListenerContainerFactory_saveFailMsgToDBConfiguration.java`
- `com/example/springkafkaconsumer/consumer/savaFailMsgToDB/OrderEventConsumerManualOffsetCommit_saveFailMsgToDBConfiguration.java`

### See integration test

- `com/example/springkafkaconsumer/integration/SaveFailMsgToDBConsumerIntegrationTest.java`

# Action

### Integration test

- trigger: com/example/springkafkaconsumer/integration/SaveFailMsgToDBConsumerIntegrationTest.java
- observe:
  - after N retry save failMsg to DB.
  
### Manual test - simulateTempDBerror

- trigger: send message `order-event-simulateTempDBerror.message` to topic `order-event-saveFailMsgToDB-topic`
- observe: after few retry
  - in console: `Try to retry failMsg with key: 1234simulateDBError-key` 
  - in db: `SELECT * FROM FAIL_RECORD` - status RETRY

### Manual test - simulateTempDBError

- trigger: send message `order-event-simulateFatalError.message` to topic `order-event-saveFailMsgToDB-topic`
- observe: after few retry
    - in console nothing for : `Try to retry failMsg with key: 1234simulateFatalError-key`
    - in db: `SELECT * FROM FAIL_RECORD` - status DEAD