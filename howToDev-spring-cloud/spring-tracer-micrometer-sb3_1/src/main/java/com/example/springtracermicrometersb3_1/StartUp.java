package com.example.springtracermicrometersb3_1;

import io.micrometer.observation.annotation.Observed;
import io.micrometer.tracing.Span;
import io.micrometer.tracing.Tracer;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@AllArgsConstructor
public class StartUp implements ApplicationListener<ApplicationReadyEvent> {

  @Autowired
  private Tracer tracer;

  @Autowired
  private MyComponent myComponent;

  @Override
  public void onApplicationEvent(final ApplicationReadyEvent event) {

    // log.info("Hello");
    myComponent.testWithSpan();
    // testWithObserved();
    //testWithClass();

  }


  @Observed(name = "user.name",
      contextualName = "getting-user-name",
      lowCardinalityKeyValues = {"userType", "userType2"})
  public void testWithObserved() {

    Map<String, String> map = MDC.getCopyOfContextMap();
    log.info("Hello testWithSpan");
  }

  public void testWithClass() {

    Span newSpan = this.tracer.nextSpan().name("test");
    try (
        Tracer.SpanInScope ignored = this.tracer.withSpan(newSpan.start())) {
      Map<String, String> map = MDC.getCopyOfContextMap();
      log.info("Hello test123");
    }
    finally {
      newSpan.end();
    }

  }


}