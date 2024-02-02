package com.example.springhibernatejpa;

import java.sql.SQLException;
import org.aspectj.lang.annotation.Before;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringHibernateJpaApplicationTests {

  @Before
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
  void contextLoads() {

  }

}
