package com.example.microservice.config;

import java.util.HashMap;
import java.util.Map;
import org.springframework.boot.actuate.info.Info.Builder;
import org.springframework.boot.actuate.info.InfoContributor;
import org.springframework.stereotype.Component;

//#hint: custom InfoContributor, so see http://127.0.0.1:8008/actuator/info {users.active, users.inactive}
@Component
public class MyInfoContributor implements InfoContributor {

  @Override
  public void contribute(Builder builder) {
    Map<String, Integer> userDetails = new HashMap<>();
    userDetails.put("active", 9999);
    userDetails.put("inactive", 8888);

    builder.withDetail("users", userDetails);
  }
}
