
### Trigger sending message
- trigger: `POST http://localhost:8001/order/v3/event`
- observe: In console of `springboot-kafka-consumer` 


depends:
 - mocks
 - springboot-kafka-producer
 - springboot-kafka-consumer