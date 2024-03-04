# Depends:
- mocks
- docker
- howToDev-spring-cloud/openFeign/spring-microservice-openFeign
- howToDev-spring-cloud/openFeign/spring-microservice-webserver

# See
### Configuration
- package `howToDev-spring-cloud/openFeign/spring-microservice-openFeign/src/main/java/com/example/springmicroserviceopenfeign/feign`
- `howToDev-spring-cloud/openFeign/spring-microservice-openFeign/build.gradle`
- domain related stuff:
  - package `howToDev-spring-cloud/openFeign/spring-microservice-openFeign/src/main/java/com/example/springmicroserviceopenfeign/domain`

### Integration test

- `com.example.springmicroserviceopenfeign.domain.service.OrderServiceTest`


### Manual test - openFeign microservice request to resource microservice
- description: 
  - request to openFeign microservice require valid token
  - request to microservice microservice require valid token

- trigger:
  - add break points on:
    - `com.example.springmicroserviceopenfeign.domain.controller.OrderController.getAll`
    - `com.example.springmicroservicewebserver.controller.OrderController.getAll`
  - `curl -X GET -v -H @authorization-header-helper-file.txt http://localhost:8010/order/getAll`
- observe:
  - the two break points
  - response of `curl`


# Help
- +readMe/demos/openFeign/header-helper-file.txt:
```text
Authorization: Bearer eyJhbGciOiJSUzI...
```

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
