package com.example.springtracermicrometeropenfeign.domain.service;

import com.example.springtracermicrometeropenfeign.domain.model.Event;
import com.example.springtracermicrometeropenfeign.domain.model.Order;
import com.example.springtracermicrometeropenfeign.domain.model.OrderEventType;
import com.example.springtracermicrometeropenfeign.domain.myfeignclient.OrderFeignClient;
import com.example.springtracermicrometeropenfeign.feign.factory.OpenFeignFactory;
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
      @Value("${myFeign.rest-servers.spring-tracer-producer-webserver.url}") String microserviceWebserverUrl) {

    this.openFeignFactory = openFeignFactory;
    orderRestClient = this.openFeignFactory.getMyRestClient(OrderFeignClient.class, microserviceWebserverUrl);
  }

  public void sendHttpMessage(Event<OrderEventType, Order> message) {

    orderRestClient.sendHttpMessage(message);

  }

}
