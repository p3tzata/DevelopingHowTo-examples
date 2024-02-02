package com.example.springtracermicrometer.spantemplate;

import io.micrometer.tracing.Span;
import io.micrometer.tracing.Tracer;

public class TraceRunnableWrapper implements Runnable {

  private static final String DEFAULT_SPAN_NAME = "default_span_name";

  private final Tracer tracer;

  private final Runnable delegate;

  private final Span parent;

  private final String spanName;

  public TraceRunnableWrapper(Tracer tracer, Runnable delegate) {

    this(tracer, delegate, null);
  }

  public TraceRunnableWrapper(Tracer tracer, Runnable delegate, String name) {

    this.tracer = tracer;
    this.delegate = delegate;
    this.parent = tracer.currentSpan();
    this.spanName = name != null ? name : DEFAULT_SPAN_NAME;
  }

  @Override
  public void run() {

    Span childSpan = this.tracer.nextSpan(this.parent).name(this.spanName);

    try (Tracer.SpanInScope ws = this.tracer.withSpan(childSpan.start())) {
      this.delegate.run();
    }
    catch (Exception | Error e) {
      childSpan.error(e);
      throw e;
    }
    finally {
      childSpan.end();
    }
  }

}
