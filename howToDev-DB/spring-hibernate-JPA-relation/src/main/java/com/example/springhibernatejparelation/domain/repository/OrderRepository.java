package com.example.springhibernatejparelation.domain.repository;

import com.example.springhibernatejparelation.domain.model.OrderEntity;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Long> {

  @Query(
      "SELECT item FROM OrderEntity item JOIN item.pickerIds p WHERE item.orderCode = :orderCode and p = :pickerId")
  Set<OrderEntity> findAllByOrderCodeAndPickerId(@Param("pickerId") String pickerId,
      @Param("orderCode") String orderCode);

}
