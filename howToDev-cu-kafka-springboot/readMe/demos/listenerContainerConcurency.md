### 1. No concurrency (=1)
- Set `spring.kafka.listener.concurrency=1` in `springboot-kafka-consumer`
  - observer in console:
    - `[ntainer#0-0-C-1]` ... `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-0, 
      order-event-topic-2, order-event-topic-1]`
      - this means that only one tread is in charge. `[ntainer#0-0-C-1]` is a thread name.
  
- Set `spring.kafka.listener.concurrency=2` in `springboot-kafka-consumer`
  - observer in console:
    - `[ntainer#0-0-C-1]` ... `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-0, order-event-topic-1]`
    - `[ntainer#0-1-C-1]`... `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-2]`
    - above two indicate that two threads are in charge. I think one particular partitions won't be read by two or more threads.

- Set `spring.kafka.listener.concurrency=4` in `springboot-kafka-consumer`. concurrency=4 is more than partitions(3 count).
  - observer in console:
    - `[ntainer#0-0-C-1]` ... `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-0]`
    - `[ntainer#0-1-C-1]` ... `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-1]`
    - `[ntainer#0-2-C-1]` ... `springboot-kafka-consumer-annotated-group-id: partitions assigned: [order-event-topic-2]`
    - I think one thread(4th thread) is not used.



depends:
- mocks
- springboot-kafka-consumer