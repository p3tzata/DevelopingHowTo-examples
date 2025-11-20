package com.example.microservice.job;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.Meter.MeterProvider;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Tags;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MyJob {

  private final Counter myCounterProducer;
  private double gaugeValue = 0.0;

  AtomicInteger atomicInteger;

  String podName;
  private AtomicInteger gauge;

  @Autowired
  public MyJob(MeterRegistry collectorRegistry) {

    podName = getRandomValue() + "-pod";

    atomicInteger = new AtomicInteger(1);
    myCounterProducer = Counter
        .builder("my_job_counter_produced_12")
        .tag("pod", podName)
        .description("myJob Counter Produced")
        .register(collectorRegistry);

    gauge = collectorRegistry
        .gauge("my_job_gouge_produced_single_4",
            new AtomicInteger(Long.valueOf(getSingleValue()).intValue()));

  }

  @Scheduled(fixedRate = 3600000L)
  public void myScheduleCounter() {

//    myCounterProducer
//        .withTags(Tags.of("pod", podName, "/Source", "myJob", "/MessageType", "myMessageType", "/MessageStatus",
//            MyJobStatus.SUCCESSFUL.name()))
//        .increment();

    myCounterProducer.increment();
    System.out.println("myScheduleCounter is called");

  }

  public int getRandomValue() {

    Random random = new Random();
    int result = random.nextInt(100 + 1 - 20) + 20;
    return result;
  }

  public int getSingleValue() {

    System.out.println("getSingleValue is called");
    return 8;
  }

  //@Scheduled(cron = "* 10 11 * * ?")
  @Scheduled(fixedRate = 30000L)
  public void myScheduleGauge() {


    gauge.set(getSingleValue());

  }


}
