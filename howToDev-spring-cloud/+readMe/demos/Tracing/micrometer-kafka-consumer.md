# Depends:

- `howToDev-spring-cloud/tracer/spring-tracer-micrometer-kafka-consumer`

# See

### Configuration

- `build.gradle`
  - `io.micrometer:micrometer-tracing-bridge-brave` 
- search for `readMe:` for comments.

### Manual test - cmd-producer -> spring-kafka-consumer

- trigger:
    - Send message - `./mocks.bash kafka producer order-event-klc-n1-topic ./kafkaFiles/order-event-normal.message`

- observe:
    - traceId and SpanId in console. (by KafkaMessageListener and OrderService) all must be the same.
    - 
