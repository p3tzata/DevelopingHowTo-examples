package com.example.eurekadiscoverserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

//#cu_eureca-discover-server-enabled
@EnableEurekaServer
@SpringBootApplication
public class EurekaDiscoverServerApplication {

  public static void main(String[] args) {

    SpringApplication.run(EurekaDiscoverServerApplication.class, args);
  }

}
