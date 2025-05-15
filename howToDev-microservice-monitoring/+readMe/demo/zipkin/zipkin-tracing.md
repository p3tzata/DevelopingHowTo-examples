# Depends:
    - `howToDev-microservice-monitoring/microservice-zipkin-parent`
    - `howToDev-microservice-monitoring/microservice-zipkin-child`
    - `howToDev-microservice-monitoring/microservice-zipkin-grandchild`
    -  mocks 

# See
### Configuration
 - dependencies:
  - `implementation 'org.springframework.boot:spring-boot-starter-aop'`
  - `implementation 'org.springframework.boot:spring-boot-starter-actuator'`
  - `implementation group: 'io.micrometer', name: 'micrometer-tracing-bridge-brave'`
  - `implementation group: 'io.zipkin.reporter2', name: 'zipkin-reporter-brave'`
  - `implementation group: 'com.github.loki4j', name: 'loki-logback-appender', version: '1.4.1'` - ship logs to loki
 - `application.yml`
 

### Manual test
  - `curl --location 'http://localhost:8010/zipkin-parent/parent'` 
  - copy some traceId and search for it in zipkin UI - `http://localhost:9411/zipkin/`

# Help
 - `curl --location 'http://localhost:8010/zipkin-parent/parent`
 - `http://localhost:9411/zipkin/`
    


