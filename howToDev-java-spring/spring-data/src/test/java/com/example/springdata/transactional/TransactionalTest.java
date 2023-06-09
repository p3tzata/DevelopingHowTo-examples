package com.example.springdata.transactional;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertThrowsExactly;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.repository.OrderRepository;
import com.example.springdata.service.transactional.OrderService;
import java.sql.SQLException;
import org.h2.tools.Server;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.UnexpectedRollbackException;

@SpringBootTest
public class TransactionalTest {
  @Autowired
  OrderRepository orderRepository;

  @Autowired
  OrderService orderService;

  private OrderEntity orderEntity = OrderEntity.builder()
      .id(1L)
      .orderCode("test")
      .build();
  @AfterEach
  public void dearDown(){
    orderRepository.deleteAll();
  }
  @BeforeEach
  public void setUpH2Console() throws SQLException {
    /**
     * In you IDE, when setting breakpoints, verify that the breakpoints you set, suspend the Thread only and not all threads.
     * All Threads would also suspend the H2 server thread. In Intellij this is done my right-clicking on the Breakpoint and select Suspend: Thread.
     *
     * Look in: http://localhost:8777/ with `JDBC URL` from application.yml(spring.datasource.url), leave unchanged username
     * and password
     *
     * If you use @AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE), it should be set to None, because
     * schema is getenerate with random name;
     * https://stackoverflow.com/questions/54675623/datajpatest-ignores-spring-datasource-url-configuration-how-to-fix
     *
     */
    Server.createWebServer("-web", "-webAllowOthers", "-webPort", "8777")
        .start();
  }


  @Test
  void InTransaction_save_orderService2saveWithNewTransactionThrowError() {

    assertDoesNotThrow(() ->orderService.InTransaction_save_orderService2saveWithNewTransactionThrowError(orderEntity));

    String debug = "debug";

  }

  @Test
  void InTransaction_save_orderService2saveWithTransactionThrowError() {

    assertThrowsExactly(UnexpectedRollbackException.class,
        () -> orderService.InTransaction_save_orderService2saveWithTransactionThrowError(orderEntity));

    String debug = "debug";

  }

  @Test
  void NoTransaction_save_orderService2saveWithTransactionThrowError(){
    assertDoesNotThrow(() ->orderService.NoTransaction_save_orderService2saveWithTransactionThrowError(orderEntity));

    String debug = "debug";
  }

}
