package com.example.microservice.config;

import java.util.Map;
import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
import org.springframework.stereotype.Component;

//#hint: custom actuator endpoint
@Component
@Endpoint(id = "myActuatorEndpoint")
public class MyActuatorEndpoint {

  @ReadOperation
  public Map<String, String> customEndpoint() {
    return Map.of("testKey", "testValue");
  }

}
