package com.example.springhibernatejpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class SpringHibernateJpaApplication {

  public static void main(String[] args) {

    SpringApplication.run(SpringHibernateJpaApplication.class, args);
  }

}
