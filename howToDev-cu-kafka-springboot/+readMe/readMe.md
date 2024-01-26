## Mocks
Ref to `mocks/readMe.md`

## Producer
- `POST http://localhost:8001/order/vN/event - v1, v2 ... vN.
- `POST http://localhost:8001/order/v1/event`
  - curl --location 'http://localhost:8001/order/v1/event' \
    --header 'Content-Type: application/json' \
    --data '{
    "eventId": 123,
    "eventType": "create",
    "payload": {
    "orderId": 123,
    "orderCode": "orderCode122"
    }
    }'

## H2 Console - `http://localhost:8002/h2-console/`

## Other
 - Intellij idea - enable annotation processing

