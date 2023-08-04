### We have one topic with 3 partitions
`kafka-topics --bootstrap-server localhost:9093 --describe --topic test-topic`

### Start consumers with same --group, in tree different terminals.
`kafka-console-consumer --bootstrap-server localhost:9093 --topic test-topic --group my-console-consumer-69  --property 
"print.key=true" --property "print.value=true" --property "key.separator= : "`

### Produce - sometime change key of the message.
`kafka-console-producer --bootstrap-server localhost:9093 --topic test-topic --property "key.separator=:" --property "parse.
key=true"`
Example message: 4:four

## Observe
- This is parallelism of consumption.
- Same key goes on same partition.
- `kafka-consumer-groups --bootstrap-server localhost:9093 --group my-console-consumer-69 --describe`
  - If we stop all consumers LAG will be incremented.


depends:
  - mocks
  - local kafka
