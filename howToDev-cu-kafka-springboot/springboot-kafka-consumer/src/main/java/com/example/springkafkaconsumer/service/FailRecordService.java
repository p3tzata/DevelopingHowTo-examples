package com.example.springkafkaconsumer.service;

import com.example.springkafkaconsumer.persistence.failRecord.FailRecord;
import com.example.springkafkaconsumer.persistence.failRecord.FailRecordRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class FailRecordService {

  private FailRecordRepository failRecordRepository;

  @Autowired
  public FailRecordService(FailRecordRepository failRecordRepository) {

    this.failRecordRepository = failRecordRepository;
  }

  public void saveFailRecord(ConsumerRecord<String, String> consumerRecord, Exception e, String status) {

    FailRecord failRecord = FailRecord.builder()
        .topic(consumerRecord.topic())
        .keyOfRecord(consumerRecord.key().toString())
        .valueOfRecord(consumerRecord.value().toString())
        .partition(consumerRecord.partition())
        .offsetValue(consumerRecord.offset())
        .exception(e.getMessage().substring(0,200))
        .status(status)
        .build();

    FailRecord saved = failRecordRepository.saveAndFlush(failRecord);

  }
}
