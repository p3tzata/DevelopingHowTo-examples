package com.example.springkafkaconsumer.persistence.failRecord;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FailRecordRepository extends JpaRepository<FailRecord, Long> {

  List<FailRecord> findAllByStatus(String status);
}
