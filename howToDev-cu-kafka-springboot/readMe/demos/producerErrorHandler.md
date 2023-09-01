# See
### Configuration


### Integration test


# Action

### Integration test

- Trigger: 
- Observe:

  
### Manual test - Broker not available. 

- Trigger: 
  - stop all mocks(zookeeper and all kafka brokers.)
  - send message via postman (POST http://localhost:8001/order/v3/event )
- Observe: 
  - execution in postman is hanging for `max.block.ms = 60000`
    - "Internal Server Error"
  - in console of `springboot-kafka-producer` 
    - Connection to node N (/127.0.0.1:NNNN) could not be established. Broker may not be available.
    - After `max.block.ms = 60000` 
      - org.apache.kafka.common.errors.TimeoutException: Topic order-event-topic not present in metadata after 60000 ms.
- Trigger:
  - start all macks
  - send message via postman (POST http://localhost:8001/order/v3/event )
- Observe:
  - in console of `springboot-kafka-producer`
    - Resetting the last seen epoch of partition order-event-normal-topic-N to NNN since the associated topicId changed 
      from null to xXxXxXxXxXxXxXxXxXx - caused by temporary unavailable kafka broker, this metadata is got with first call of 
      `kafkaTemplate.send(...)` 

### Manual test - min.insync.replicas.

- Trigger:
  - To make sure that min.insync.replicas of the topic is 2:
    - `./mocks.bash kafka describeTopics` see Topic: order-event-topic ...  Configs: min.insync.replicas=2
  - Leave only one kafka broker running
      - docker stop cu-kafka-springboot-kafka-4
      - docker stop cu-kafka-springboot-kafka-3
      - ./mocks.bash status (only one broker is running)
  - send message via postman (POST http://localhost:8001/order/v3/event )
- Observe:
  - in console of `springboot-kafka-producer`
  - 15 times - Got error produce response with correlation id 210 on topic-partition order-event-topic-0, retrying (14 attempts 
    left). Error: NOT_ENOUGH_REPLICAS
  - KafkaProducerException: Failed to send; nested exception is org.apache.kafka.common.errors.NotEnoughReplicasException: Messages are rejected since there are fewer in-sync replicas than required.


# Help
- DB - `http://localhost:8002/h2-console/`
- Delete message in topic - `./mocks.bash kafka delete kafkaFiles/delete-records.message`
- Post body for sending message via postman
  ```json
  {
      "eventKey": "1469",
      "eventType": "create",
      "payload": {
          "orderId": 123,
          "orderCode": "orderCode122"
      }
  }
  ```