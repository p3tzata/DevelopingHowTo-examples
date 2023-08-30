package com.example.springkafkaconsumer.service;

import com.example.springkafkaconsumer.persistence.failRecord.FailRecord;
import com.example.springkafkaconsumer.persistence.failRecord.FailRecordRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class FailRecordSchedulerJob {

  private FailRecordRepository failRecordRepository;
  private OrderService orderService;

  @Autowired
  public FailRecordSchedulerJob(FailRecordRepository failRecordRepository, OrderService orderService) {

    this.failRecordRepository = failRecordRepository;
    this.orderService = orderService;
  }

  @Scheduled(fixedRate = 10_000)
  private void check() {

    log.info("FailRecordSchedulerJob working");
    failRecordRepository.findAllByStatus("RETRY")
        .forEach(x -> {
          log.info("Try to retry failMsg with key: {}", x.getKeyOfRecord());
          ConsumerRecord<String, String> builtRecord = buildConsumerRecord(x);
          try {
            orderService.processConsumerRecord(builtRecord);
            x.setStatus("SUCCESS");
            failRecordRepository.saveAndFlush(x);
          }
          catch (Exception e) {
            log.error("Error in FailRecordSchedulerJob: {}", e);
          }
        });

  }

  private ConsumerRecord<String, String> buildConsumerRecord(FailRecord x) {

    return new ConsumerRecord<String, String>(x.getTopic(),
        x.getPartition(),
        x.getOffsetValue(),
        x.getKeyOfRecord(),
        x.getValueOfRecord());
  }


}
