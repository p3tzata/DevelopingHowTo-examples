# Depends:

- mocks
- `howToDev-spring-cloud/tracer/spring-tracer-micrometer-openfeign`
- `howToDev-spring-cloud/tracer/spring-tracer-micrometer-kafka-producer`
- `howToDev-spring-cloud/tracer/spring-tracer-micrometer-kafka-consumer`

# See

### Configuration

- search for `readMe:`


### Manual test - XXXXX

- description:
pass traceId trough rest(openFeign) and kafka. Workflow:

`curl` -> `(Http request)` -> `spring-tracer-micrometer-openfeign` <br>
`spring-tracer-micrometer-openfeign` -> `(Http request)` -> `spring-tracer-micrometer-kafka-producer` <br>
`spring-tracer-micrometer-kafka-producer` -> `(Kafka message)` -> `spring-tracer-micrometer-kafka-consumer`<br>


- trigger:
  - send http request with `curl` see help section.
- observe:
  - search traceId in `console` of the `spring-tracer-micrometer-openfeign`, `spring-tracer-micrometer-kafka-producer`, `spring-tracer-micrometer-kafka-consumer`

# Help
- get valid access token:
```text
curl --location 'http://localhost:8008/auth/realms/myRealm/protocol/openid-connect/token' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'grant_type=password' \
  --data-urlencode 'username=my-appuser' \
  --data-urlencode 'password=123456' \
  --data-urlencode 'client_id=my-developing-help-service' \
  --data-urlencode 'client_secret=PBd6UqpDakkLP6duVQfURWKdGNRdzBsj'
```

- Happy path kafka message
```text
 curl -X POST -v -H @authorization-header-helper-file.txt 'http://localhost:8012/orderEvent/v1/event' \
--header 'Content-Type: application/json'  --data '{
"eventKey": "key123",
"eventType": "create",
"payload": {
    "orderId": 123,
    "orderCode": "orderCode123"
 }
}'
```

- Simulate consumer error, so Backoff FixedBackOff{interval=1000, currentAttempts=14, maxAttempts=13} exhausted for order-event-klc-n1-topic-1
```text
 curl -X POST -v -H @authorization-header-helper-file.txt 'http://localhost:8012/orderEvent/v1/event' \
--header 'Content-Type: application/json'  --data '{
"eventKey": "1234simulateFatalError-key",
"eventType": "create",
"payload": {
    "orderId": 123,
    "orderCode": null
    }
}'
```



