package com.example.springdata.transactional;

import com.example.springdata.entity.OrderEntity;
import com.example.springdata.repository.OrderRepository;
import com.example.springdata.service.transactional.OrderService;
import java.sql.SQLException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.h2.tools.Server;

@SpringBootTest
public class _TransactionalTest {

  @Autowired
  OrderRepository orderRepository;

  @Autowired
  OrderService orderService;

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
  void getTransactionalId() {

    OrderEntity orderEntity = OrderEntity.builder()
        .id(1L)
        .orderCode("test")
        .build();

    orderService.saveWithOutTransactional(orderEntity);

    String debug = "debug";

  }

  @Test
  void getTransactionalId_2() {

    OrderEntity orderEntity = OrderEntity.builder()
        .id(1L)
        .orderCode("test")
        .build();

    orderService.saveWithTransactional(orderEntity);

    String debug = "debug";

  }


  @Test
  void getTransactionalId_3() {

    OrderEntity orderEntity = OrderEntity.builder()
        .id(1L)
        .orderCode("test")
        .build();

    orderService.passToService2(orderEntity);

    String debug = "debug";

  }

  @Test
  void getTransactionalId_4() {

    OrderEntity orderEntity = OrderEntity.builder()
        .id(1L)
        .orderCode("test")
        .build();

    orderService.passToService2_newTransaction(orderEntity);

    String debug = "debug";

  }

  @Test
  void getTransactionalId_5() {

    OrderEntity orderEntity = OrderEntity.builder()
        .id(1L)
        .orderCode("test")
        .build();
    try {
      orderService.passToService2_newTransactionThrowError(orderEntity);

    }
    catch (Exception ex) {
      String message = ex.getMessage();
    }

    String debug = "debug";

  }





  @Test
  public void save123() {

    OrderEntity orderEntity = OrderEntity.builder()
        .id(1L)
        .orderCode("test")
        .build();
    try {
      orderService.save123(orderEntity);
    } catch (Exception exception) {
      String debug = "debug";
    }
    String debug = "debug";

  }


}
