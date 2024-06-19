package com.example.springhibernatejpa.domain.repository;

import com.example.springhibernatejpa.domain.model.OrderNonCachableEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderNonCachableRepository extends JpaRepository<OrderNonCachableEntity, Long> {

}
