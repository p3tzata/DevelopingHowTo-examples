package com.example.springhibernatejpa.domain.repository;

import com.example.springhibernatejpa.domain.model.OrderCachableEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderCachableRepository extends JpaRepository<OrderCachableEntity, Long> {

}
