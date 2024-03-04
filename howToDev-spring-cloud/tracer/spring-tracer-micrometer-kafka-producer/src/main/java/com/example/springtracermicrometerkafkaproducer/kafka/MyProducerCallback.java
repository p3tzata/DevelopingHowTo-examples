package com.example.springtracermicrometerkafkaproducer.kafka;

import io.micrometer.tracing.Span;
import io.micrometer.tracing.Tracer;
import java.nio.charset.StandardCharsets;
import java.util.function.BiConsumer;
import org.slf4j.Logger;
import org.springframework.kafka.support.SendResult;

//readMe: this MyProducerCallback is need to attach traceId and spanId to log of producer callback logger. Inspired by https://stackoverflow.com/a/57855172.
public class MyProducerCallback implements BiConsumer<SendResult<String, String>, Throwable> {

  private final Logger log;
  private final String key;

  private final Span nextSpan;
  private final Tracer tracer;

  public MyProducerCallback(Span nextSpan, Tracer tracer, Logger log, String key) {

    this.log = log;
    this.key = key;
    this.nextSpan = nextSpan;
    this.tracer = tracer;
  }

  private MyProducerCallback() {

    log = null;
    key = null;
    tracer = null;
    nextSpan = null;
  }

  @Override
  public void accept(SendResult<String, String> sendResult, Throwable throwable) {

    try (Tracer.SpanInScope ws = this.tracer.withSpan(nextSpan.start())) {

      if (throwable == null) {
        log.info("Successfully send message with key: {}, traceparent: {}, sendResult: {}", key,
            new String(sendResult.getProducerRecord().headers().headers("traceparent").iterator().next().value(),
                StandardCharsets.UTF_8), sendResult);
      }
      else {
        log.info("Error send message with key: {}, throwable: {}", key, throwable);
      }

    }
    catch (Exception | Error e) {
      nextSpan.error(e);
      throw e;
    }
    finally {
      nextSpan.end();
    }

  }


}

