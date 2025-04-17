package com.example.spring3data;

import com.example.spring3data.repository.OrderRepository;
import com.example.spring3data.service.OrderServiceNestedMethod;
import java.sql.SQLException;
import org.h2.tools.Server;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class _TransactionalNestedMethodTest {

  @Autowired
  OrderRepository orderRepository;

  @Autowired
  OrderServiceNestedMethod orderService;

  public void tearDown() {

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
  void givenTransactionMethodACallMethodBWhichCatchAllException() {

    try {
      orderService.methodA();
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    String debug = "debug";

  }

  @Test
  void givenTransactionMethodA1CallMethodB1WhichCatchAllExceptionAndFlush()  {

    try {
      orderService.methodA1();
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    String debug = "debug";

  }


  @Test
  void givenTransactionMethodCCallMethodDWhichCatchAllException() {

    try {
      orderService.methodC();
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    String debug = "debug";

  }

  @Test
  void givenTransactionMethodFCallMethodFromOtherService() {

    try {
      orderService.methodF();
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    String debug = "debug";

  }



}
