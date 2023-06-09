package com.example.mvcwebapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.client.web.reactive.function.client.ServletOAuth2AuthorizedClientExchangeFilterFunction;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

//#cu_bean - WebClient
@Configuration
public class ConfigBean {

  @Bean
  public RestTemplate restTemplate() {

    return new RestTemplate();
  }

  @Bean
  public WebClient webClient(ClientRegistrationRepository clientRegistrationRepository,
      OAuth2AuthorizedClientRepository oAuth2AuthorizedClientRepository) {
    //clientRegistrationRepository - registered oauth2 clients.

    //Mechanism of including access token
    ServletOAuth2AuthorizedClientExchangeFilterFunction filterFunction =
        new ServletOAuth2AuthorizedClientExchangeFilterFunction(clientRegistrationRepository,oAuth2AuthorizedClientRepository);

    //With this, the framework will try to obtain the client information from the current Authentication object managed in Spring Security.
    filterFunction.setDefaultOAuth2AuthorizedClient(true);

    //Applying filterFunction.oauth2Configuration() will attach access token on every single request. Which might not be the
    // desired behavior. So we have to not use this webClient to third party because our access token is exposed.
    return WebClient.builder().apply(filterFunction.oauth2Configuration()).build();
  }
}
