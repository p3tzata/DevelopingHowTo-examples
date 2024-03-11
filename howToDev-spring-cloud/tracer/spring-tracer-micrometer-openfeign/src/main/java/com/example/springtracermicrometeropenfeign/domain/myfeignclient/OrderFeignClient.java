package com.example.springtracermicrometeropenfeign.domain.myfeignclient;

import com.example.springtracermicrometeropenfeign.domain.model.Event;
import com.example.springtracermicrometeropenfeign.domain.model.Order;
import com.example.springtracermicrometeropenfeign.domain.model.OrderEventType;
import com.example.springtracermicrometeropenfeign.feign.MyRestClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public interface OrderFeignClient extends MyRestClient {

  String SEND_HTTP_MESSAGE_PATH = "/orderEvent/v1/event";

  @RequestMapping(value = SEND_HTTP_MESSAGE_PATH,
      method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  ResponseEntity<Void> sendHttpMessage(@RequestBody Event<OrderEventType, Order> requestBody);

}
