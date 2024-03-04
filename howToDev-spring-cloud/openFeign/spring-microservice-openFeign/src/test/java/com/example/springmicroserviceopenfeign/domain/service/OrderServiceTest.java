package com.example.springmicroserviceopenfeign.domain.service;


import static com.github.tomakehurst.wiremock.client.WireMock.stubFor;
import static java.nio.charset.Charset.defaultCharset;
import static java.util.Arrays.asList;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.util.StreamUtils.copyToString;

import com.example.springmicroserviceopenfeign.domain.model.Order;
import com.example.springmicroserviceopenfeign.domain.myfeignclient.OrderFeignClient;
import java.io.IOException;
import org.springframework.http.MediaType;
import com.example.springmicroserviceopenfeign.test.integration.MyCustomKeycloakContainer;
import com.github.tomakehurst.wiremock.client.WireMock;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.contract.wiremock.AutoConfigureWireMock;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;

@SpringBootTest
@AutoConfigureWireMock(port = 0)
public class OrderServiceTest {

  static final MyCustomKeycloakContainer keycloakContainer = new MyCustomKeycloakContainer().withReuse(true);

  static {
    keycloakContainer.start();
  }

  @DynamicPropertySource
  static void registerProperties(DynamicPropertyRegistry registry) {

    registry.add("spring.security.oauth2.client.provider.my-microservice-openfeign-regId.token-uri",
        () -> keycloakContainer.getTokenUri());
  }

  @Autowired
  private OrderService orderService;

  @AfterEach
  public void tearDownAbstract() {

    WireMock.reset();
    WireMock.resetAllScenarios();
    WireMock.resetAllRequests();
    WireMock.removeAllMappings();

  }

  @Test
  void testGetAll() throws IOException {

    createStub();

    assertTrue(orderService.getAll()
        .containsAll(asList(
            new Order(1L, "order1"),
            new Order(2L, "order2"))));
  }

  private void createStub() throws IOException {

    stubFor(WireMock.get(WireMock.urlEqualTo(OrderFeignClient.GET_ALL_PATH))
        .willReturn(WireMock.aResponse()
            .withStatus(HttpStatus.OK.value())
            .withHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE)
            .withBody(
                copyToString(
                    Order.class.getClassLoader().getResourceAsStream("stubPayload/get-orders-response.json"),
                    defaultCharset()))));
  }
}
