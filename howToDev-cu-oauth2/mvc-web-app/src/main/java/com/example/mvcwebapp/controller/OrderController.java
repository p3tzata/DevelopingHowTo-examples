package com.example.mvcwebapp.controller;

import com.example.mvcwebapp.model.Order;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

//#cu_orderController

@Controller
@RequestMapping("/order")
public class OrderController {


  OAuth2AuthorizedClientService oAuth2AuthorizedClientService;
  OAuth2AuthorizedClientRepository oAuth2AuthorizedClientRepository;
  RestTemplate restTemplate;

  WebClient webClient;

  @Autowired
  public OrderController(OAuth2AuthorizedClientService oAuth2AuthorizedClientService,
      OAuth2AuthorizedClientRepository oAuth2AuthorizedClientRepository, RestTemplate restTemplate, WebClient webClient) {

    this.oAuth2AuthorizedClientService = oAuth2AuthorizedClientService;
    this.oAuth2AuthorizedClientRepository = oAuth2AuthorizedClientRepository;
    this.restTemplate = restTemplate;
    this.webClient = webClient;
  }

  @GetMapping("/getAll")
  public String getAllOrders(Model model, @AuthenticationPrincipal OidcUser principal) {
    //OidcUser principal - currently authenticated user.
    OidcIdToken idToken = principal.getIdToken(); //Contain only info for user.
    OidcUserInfo userInfo = principal.getUserInfo();

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    OAuth2AuthenticationToken token = (OAuth2AuthenticationToken) authentication;

    //Retrieve authorized client(may by like cu-mvc-web-app, google, facebook, github) for the specified clientRegistrationId and
    // principalName
    //There is case to be handled. When app is restart it loose OAuth2AuthorizedClient.
    OAuth2AuthorizedClient oAuth2AuthorizedClient = oAuth2AuthorizedClientService.loadAuthorizedClient(
        token.getAuthorizedClientRegistrationId(), token.getName());

    if (oAuth2AuthorizedClient != null) {

      OAuth2AccessToken accessToken = oAuth2AuthorizedClient.getAccessToken();
      String tokenValue = accessToken.getTokenValue();

      String url = "http://localhost:8003/order/getAll";
      HttpHeaders headers = new HttpHeaders();
      headers.add("Authorization", "Bearer " + tokenValue);

      HttpEntity<List<Order>> entity = new HttpEntity<>(headers);

      ResponseEntity<List<Order>> responseEntity = restTemplate.exchange(url, HttpMethod.GET, entity,
          new ParameterizedTypeReference<List<Order>>() {
          });

      List<Order> orders = responseEntity.getBody();
      model.addAttribute("orderList", orders);

    }

    return "orders";
  }

  @GetMapping("/getAll_withWebClient")
  public String getAll_withWebCLient(Model model) {

    String url = "http://localhost:8003/order/getAll";

    List<Order> orders = webClient.get().uri(url)
        .retrieve().bodyToMono(new ParameterizedTypeReference<List<Order>>() {}).block();

        model.addAttribute("orderList", orders);

    return "orders";
  }


}
