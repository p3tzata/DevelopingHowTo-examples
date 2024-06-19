package com.example.spring3data.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity()
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "orderEntity", indexes = {
    @Index(name = "idx_orderCode_uc", columnList = "orderCode", unique = true)
})
public class OrderEntity {
  @Id
  private Long id;

  private String orderCode;

}
