package com.example.springmicroserviceopenfeign.domain.service;

import com.example.springmicroserviceopenfeign.domain.model.Order;
import com.example.springmicroserviceopenfeign.domain.myfeignclient.OrderFeignClient;
import com.example.springmicroserviceopenfeign.feign.factory.OpenFeignFactory;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class OrderService {

  private OpenFeignFactory openFeignFactory;
  private OrderFeignClient orderRestClient;

  public OrderService(OpenFeignFactory openFeignFactory,
      @Value("${myFeign.rest-servers.spring-microservice-webserver.url}") String microserviceWebserverUrl) {

    this.openFeignFactory = openFeignFactory;
    orderRestClient = this.openFeignFactory.getMyRestClient(OrderFeignClient.class, microserviceWebserverUrl);
  }

  public List<Order> getAll() {

    return List.of(orderRestClient.getAll().getBody());
  }

}
