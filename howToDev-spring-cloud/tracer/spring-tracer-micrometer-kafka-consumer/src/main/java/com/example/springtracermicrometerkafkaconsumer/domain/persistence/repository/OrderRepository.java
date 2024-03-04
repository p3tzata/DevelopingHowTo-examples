package com.example.springtracermicrometerkafkaconsumer.domain.persistence.repository;

import com.example.springtracermicrometerkafkaconsumer.domain.persistence.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Long> {

}
