package com.example.springtracermicrometer.spantemplate;

import io.micrometer.tracing.Tracer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class SpanTemplate {

  private final Tracer tracer;

  public SpanTemplate(Tracer tracer) {

    this.tracer = tracer;
  }

  public Runnable getNewSpanInSameTrace(Runnable callback) {

    return new TraceRunnableWrapper(tracer, callback);
  }

}
