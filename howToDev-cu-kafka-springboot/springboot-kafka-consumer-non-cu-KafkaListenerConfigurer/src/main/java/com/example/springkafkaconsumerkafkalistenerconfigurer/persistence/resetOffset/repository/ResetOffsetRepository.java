package com.example.springkafkaconsumerkafkalistenerconfigurer.persistence.resetOffset.repository;

import com.example.springkafkaconsumerkafkalistenerconfigurer.persistence.resetOffset.enity.ResetOffsetEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResetOffsetRepository extends JpaRepository<ResetOffsetEntity, Long> {

 List<ResetOffsetEntity> findAllByTopicName(String topicName);

}
