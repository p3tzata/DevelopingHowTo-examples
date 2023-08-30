package com.example.springkafkaconsumer.persistence.order.repository;

import com.example.springkafkaconsumer.persistence.order.enity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity,Long> {

}
