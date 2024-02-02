package com.example.springtracermicrometersb3_1;

import io.micrometer.tracing.annotation.NewSpan;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class MyComponent {
  @NewSpan
  public void testWithSpan() {

    Map<String, String> map = MDC.getCopyOfContextMap();
    log.info("Hello testWithSpan");
  }
}
