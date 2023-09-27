package com.example.springkafkaconsumerkafkalistenerconfigurer.service;

import com.example.springkafkaconsumerkafkalistenerconfigurer.persistence.resetOffset.enity.ResetOffsetEntity;
import com.example.springkafkaconsumerkafkalistenerconfigurer.persistence.resetOffset.repository.ResetOffsetRepository;
import com.example.springkafkaconsumerkafkalistenerconfigurer.properties.KafkaConsumerProperties;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.common.TopicPartition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.listener.ConsumerSeekAware.ConsumerSeekCallback;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ResetOffsetService {

  private ResetOffsetRepository resetOffsetRepository;

  @Autowired
  public ResetOffsetService(ResetOffsetRepository resetOffsetRepository) {

    this.resetOffsetRepository = resetOffsetRepository;
  }


  public void handle(Map<TopicPartition, Long> assignments, ConsumerSeekCallback callback, KafkaConsumerProperties properties) {

    if (properties.isResetOffset()) {
      resetOffsetPartitions(assignments, callback, properties);
    }
  }

  void resetOffsetPartitions(Map<TopicPartition, Long> assignments, ConsumerSeekCallback callback,
      KafkaConsumerProperties properties) {

    TopicPartition topicPartitionFirst = assignments.keySet().stream().findFirst().orElse(null);
    String topicName = null;
    if (topicPartitionFirst != null) {
      topicName = topicPartitionFirst.topic();
    }

    List<ResetOffsetEntity> resetOffsetListEntities = resetOffsetRepository.findAllByTopicName(topicName);
    Map<Integer, ResetOffsetEntity> resetOffsetEntityMap = convertToMap(resetOffsetListEntities);

    assignments.keySet()
        .forEach(topicPartition -> resetPartitionOffset(topicPartition, callback, resetOffsetEntityMap, properties));

  }


  private void resetPartitionOffset(TopicPartition topicPartition, ConsumerSeekCallback callback,
      Map<Integer, ResetOffsetEntity> resetOffsetEntities, KafkaConsumerProperties properties) {

    Integer partition = topicPartition.partition();
    String topicName = topicPartition.topic();
    ResetOffsetEntity resetOffsetEntity = resetOffsetEntities.getOrDefault(partition, null);
    ResetOffsetEntity resetOffsetEntityForUpdate = null;

    if (resetOffsetEntity == null) {
      doResetPartitionOffset(topicPartition, callback);
      resetOffsetEntityForUpdate = ResetOffsetEntity.builder()
          .lastResetOffsetTag(properties.getResetOffsetTag())
          .partition(partition)
          .topicName(topicName)
          .build();
    }
    else {
      if (properties.getResetOffsetTag() > resetOffsetEntity.getLastResetOffsetTag()) {
        doResetPartitionOffset(topicPartition, callback);
        resetOffsetEntity.setLastResetOffsetTag(properties.getResetOffsetTag());
        resetOffsetEntityForUpdate = resetOffsetEntity;
      }
    }

    if (resetOffsetEntityForUpdate != null) {
      resetOffsetRepository.save(resetOffsetEntityForUpdate);
    }
  }

  private void doResetPartitionOffset(TopicPartition topicPartition, ConsumerSeekCallback callback) {
    log.info("resetOffset is calling, topic/partition={}/{}",topicPartition.topic(),
        topicPartition.partition());
    callback.seekToBeginning(topicPartition.topic(),topicPartition.partition());
    //callback.seek(topicPartition.topic(), topicPartition.partition(), 0);
    log.info("reread all message topic/partition={}/{}", topicPartition.topic(),
        topicPartition.partition());
  }

  private Map<Integer, ResetOffsetEntity> convertToMap(List<ResetOffsetEntity> resetOffsetListEntities) {

    return resetOffsetListEntities.stream().collect(Collectors.toMap(ResetOffsetEntity::getPartition, Function.identity()));
  }
}
