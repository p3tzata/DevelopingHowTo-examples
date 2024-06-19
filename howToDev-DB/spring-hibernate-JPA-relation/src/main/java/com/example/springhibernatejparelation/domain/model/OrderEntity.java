package com.example.springhibernatejparelation.domain.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.BatchSize;
import org.springframework.data.annotation.Persistent;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String orderCode;

  @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
  private List<OrderLineEntity> orderLines;


  //readMe: be careful with @ElementCollection, the insert is done in a separate query.
  @ElementCollection(fetch= FetchType.LAZY)
  @CollectionTable(name="order_pickers_id", joinColumns=@JoinColumn(name="order_id"))
  @Column(name="picker_id")
  @Builder.Default
  @BatchSize(size = 10)
  private Set<String> pickerIds = new HashSet<>();


}
