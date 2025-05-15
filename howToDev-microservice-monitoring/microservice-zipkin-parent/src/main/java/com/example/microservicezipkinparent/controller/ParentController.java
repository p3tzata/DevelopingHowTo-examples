package com.example.microservicezipkinparent.controller;

import io.micrometer.observation.annotation.Observed;
import io.micrometer.tracing.annotation.NewSpan;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@Slf4j
public class ParentController {

  final
  RestTemplate restTemplate;

  public ParentController(RestTemplate restTemplate) {
    this.restTemplate = restTemplate;
  }

  @GetMapping("/parent")
  @Observed(
      name = "user.name",
      contextualName = "Parent-->child",
      lowCardinalityKeyValues = {"userType", "userType2"}
  )
  public String sayHi(){
    log.info("Parent was called ...");
    log.info("Say Hi to Grandchild ...");
    ResponseEntity<String> response = restTemplate.exchange(
        "http://localhost:8011/zipkin-child/child",
        HttpMethod.GET,
        null,
        String.class
    );

    String responseFromChild = response.getBody();
    return "Grandchild said: " +  responseFromChild;

  }

}
