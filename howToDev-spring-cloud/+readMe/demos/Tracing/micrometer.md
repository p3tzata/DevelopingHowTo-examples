# Depends:
- `howToDev-spring-cloud/spring-tracer-micormeter`

# See
### Configuration
- `build.gradle`
- `com/example/springtracermicormeter/spantemplate/SpanTemplate.java`

### Manual test - traceId and spanId in console

- trigger:
  - start `howToDev-spring-cloud/spring-tracer-micormeter`. Note it will be finished by itself almost immediately.

- observe:
  - traceId and SpanId in console.

### Manual test - multithreading with same traceId in console

- trigger:
    - start `howToDev-spring-cloud/spring-tracer-micormeter`. Note it will be finished by itself almost immediately.

- observe:
    - focus on `MyComponent.multiThreadingWithSameTraceId()`
    - see two logs from two threads with same traceId.