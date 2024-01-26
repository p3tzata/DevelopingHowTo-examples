package com.example.springtracermicrometer;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@AllArgsConstructor
public class StartUp implements ApplicationListener<ApplicationReadyEvent> {

  private MyComponent myComponent;

  @Override
  public void onApplicationEvent(final ApplicationReadyEvent event) {

    myComponent.testWithNewSpanAnnotation();
    myComponent.testWithTracerClass();
    myComponent.multiThreadingWithSameTraceId();
  }

}