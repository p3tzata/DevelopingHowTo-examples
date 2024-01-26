### See configuration:
- `KafkaListenerContainerFactory_*`
- `OrderEventConsumerManualOffsetCommit_*`


### Simulate exception
- com.example.springkafkaconsumer.service.OrderService.checkToSimulateException
  - orderEntity.getOrderCode() == null -> throw new IllegalArgumentException("Order Code is null")
  - orderEntity.getOrderId() == 6969 -> throw new RecoverableDataAccessException("Simulate db error")


### Observe
- test in `com/example/springkafkaconsumer/integration/CommonErrorHandlerIntegrationTest.java`

depends:
- mocks
- springboot-kafka-consumer
- local kafka