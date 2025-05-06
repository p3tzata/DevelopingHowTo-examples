package com.example.microserviceelk;

import lombok.AllArgsConstructor;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class StartUp implements ApplicationListener<ApplicationReadyEvent> {
  private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(StartUp.class);
  @Override
  public void onApplicationEvent(final ApplicationReadyEvent event) {

    while (true) {
      try {
        log.info("Debug test");
        Thread.sleep(60000L);
      }
      catch (InterruptedException e) {
        throw new RuntimeException(e);
      }
    }

  }
}
