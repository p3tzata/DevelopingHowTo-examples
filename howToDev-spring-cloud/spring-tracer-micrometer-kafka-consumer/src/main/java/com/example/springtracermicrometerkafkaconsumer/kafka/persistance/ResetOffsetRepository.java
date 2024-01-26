package com.example.springtracermicrometerkafkaconsumer.kafka.persistance;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResetOffsetRepository extends JpaRepository<ResetOffsetEntity, Long> {

 List<ResetOffsetEntity> findAllByTopicName(String topicName);

}
