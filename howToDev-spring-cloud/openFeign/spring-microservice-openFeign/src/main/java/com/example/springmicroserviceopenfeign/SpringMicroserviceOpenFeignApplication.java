package com.example.springmicroserviceopenfeign;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class SpringMicroserviceOpenFeignApplication {

  public static void main(String[] args) {

    SpringApplication.run(SpringMicroserviceOpenFeignApplication.class, args);
  }

}
