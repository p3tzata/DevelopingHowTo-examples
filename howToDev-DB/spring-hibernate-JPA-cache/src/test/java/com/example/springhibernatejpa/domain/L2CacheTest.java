package com.example.springhibernatejpa.domain;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.example.springhibernatejpa.domain.model.OrderCachableEntity;
import com.example.springhibernatejpa.domain.repository.OrderCachableRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.hibernate.Session;
import org.hibernate.stat.Statistics;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.support.TransactionTemplate;

@SpringBootTest
public class L2CacheTest {

  @Autowired
  private TransactionTemplate transactionTemplate;

  @PersistenceContext
  private EntityManager entityManager;

  @Autowired
  private OrderCachableRepository orderCachableRepository;

  @Test
  void testL2Cache() {

    Statistics statistics = getStatistics();

    OrderCachableEntity orderCachable = OrderCachableEntity.builder().orderCode("orderCode1").build();

    orderCachableRepository.save(orderCachable);
    statistics.clear();

    orderCachableRepository.findById(1L);
    assertResultIsNotTakenFromCache(statistics);
    statistics.clear();
    orderCachableRepository.findById(1L);
    assertResultIsTakenFromCache(statistics);
    statistics.clear();
  }


  private Statistics getStatistics() {

    return transactionTemplate.execute(status ->
        entityManager.unwrap(Session.class).getSessionFactory().getStatistics());
  }

  private void assertResultIsNotTakenFromCache(Statistics stats) {

    assertEquals(1, stats.getQueryCacheMissCount());
    assertEquals(1, stats.getQueryCachePutCount());
    assertEquals(0, stats.getQueryCacheHitCount());
  }

  private void assertResultIsTakenFromCache(Statistics stats) {

    assertEquals(0, stats.getQueryCacheMissCount());
    assertEquals(0, stats.getQueryCachePutCount());
    assertEquals(1, stats.getQueryCacheHitCount());
  }


}
