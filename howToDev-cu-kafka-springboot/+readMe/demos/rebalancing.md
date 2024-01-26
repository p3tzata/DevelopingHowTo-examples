# Rebalancing consumers in one group.id

### 1. Compile and run `springboot-kafka-consumer` 
- `cd springboot-kafka-consumer/`
- `./gradlew build`
- `java -jar build/libs/springboot-kafka-consumer-0.0.1-SNAPSHOT.jar` - instance N1
   - observe in instance N1: find in console `springboot-kafka-consumer-annotated-group-id: partitions assigned: 
     [order-event-topic-0, order-event-topic-2, order-event-topic-1]`
     - this means that all tree partitions are read by one instance of consumer in group.id=springboot-kafka-consumer-annotated-group-id
- `java -jar -Dserver.port=8003 build/libs/springboot-kafka-consumer-0.0.1-SNAPSHOT.jar` - this will start instance N2
-  observe in instance N1: find in console:
   - logs from `ConsumerCoordinator`
   - `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-0, order-event-topic-1]`
-  observe in instance N2: find in console:
   - logs from `ConsumerCoordinator`
   - `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-2]`


depends:
- mocks
- springboot-kafka-consumer