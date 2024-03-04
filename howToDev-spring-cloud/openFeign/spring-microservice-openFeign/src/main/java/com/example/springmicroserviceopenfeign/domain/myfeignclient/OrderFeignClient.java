package com.example.springmicroserviceopenfeign.domain.myfeignclient;

import com.example.springmicroserviceopenfeign.domain.model.Order;
import com.example.springmicroserviceopenfeign.feign.MyRestClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public interface OrderFeignClient extends MyRestClient {

  String GET_ALL_PATH = "/order/getAll";

  @RequestMapping(value = GET_ALL_PATH,
      method = RequestMethod.GET,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  ResponseEntity<Order[]> getAll();

}
