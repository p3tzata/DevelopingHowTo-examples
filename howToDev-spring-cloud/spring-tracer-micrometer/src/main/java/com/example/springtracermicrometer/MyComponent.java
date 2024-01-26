package com.example.springtracermicrometer;

import com.example.springtracermicrometer.spantemplate.SpanTemplate;
import io.micrometer.tracing.Span;
import io.micrometer.tracing.Tracer;
import io.micrometer.tracing.annotation.NewSpan;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@AllArgsConstructor
public class MyComponent {

  private Tracer tracer;
  private SpanTemplate newSpanAPITemplate;

  @NewSpan
  public void testWithNewSpanAnnotation() {

    Map<String, String> map = MDC.getCopyOfContextMap();
    log.info("Hello testWithNewSpanAnnotation");
  }

  public void testWithTracerClass() {

    Span newSpan = this.tracer.nextSpan().name("test");
    try (
        Tracer.SpanInScope ignored = this.tracer.withSpan(newSpan.start())) {
      Map<String, String> map = MDC.getCopyOfContextMap();
      log.info("Hello testWithTracerClass");
    }
    finally {
      newSpan.end();
    }

  }

  @NewSpan
  public void multiThreadingWithSameTraceId() {

    log.info("Hello - main thread");
    Runnable validateRunnable =
        newSpanAPITemplate.getNewSpanInSameTrace(() -> doLogging());

    CompletableFuture.runAsync(validateRunnable).exceptionally(ex -> {
      log.error("Error.", ex);
      return null;
    });
  }

  public void doLogging() {
    log.info("doLogging");
  }


}
