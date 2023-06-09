package com.example.springtest.controller;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.example.springtest.model.OrderSearchCriteria;
import com.example.springtest.model.OrderSearchCriteria.OrderSearchCriteriaBuilder;
import com.example.springtest.service.OrderService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@WebMvcTest(controllers = OrderController.class)
public class OrderControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @MockBean
  private OrderService orderService;

  @Autowired
  private ObjectMapper objectMapper;

  @InjectMocks
  private OrderController orderController;


  @Test
  //@WithMockUser(roles = "SUPERVISOR")
  void givenMockGetWithCriteria_whenGetMethod_thenServiceIsCalled() throws Exception {

    //Given
    OrderSearchCriteria searchCriteria = OrderSearchCriteria.builder().id(1L).build();

    when(orderService.getWithCriteria(searchCriteria))
        .thenReturn(null);

    //When
    mockMvc
        .perform(MockMvcRequestBuilders
            .get("/order/getWithSearchCriteria")
            .param("id", searchCriteria.getId().toString()))
        .andExpect(status().isOk())
        .andDo(print());

    //Then
    verify(orderService).getWithCriteria(searchCriteria);

  }
}
