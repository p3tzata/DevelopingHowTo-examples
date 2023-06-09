package com.example.mvcwebappsociallogin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizedClientRepository;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//#cu_orderController

@Controller
@RequestMapping("/home")
public class HomeController {

  //Here inside would be - google, facebook or my custom oauth2 client
  OAuth2AuthorizedClientService oAuth2AuthorizedClientService;
  OAuth2AuthorizedClientRepository oAuth2AuthorizedClientRepository;

  @Autowired
  public HomeController(OAuth2AuthorizedClientService oAuth2AuthorizedClientService,
      OAuth2AuthorizedClientRepository oAuth2AuthorizedClientRepository) {

    this.oAuth2AuthorizedClientService = oAuth2AuthorizedClientService;
    this.oAuth2AuthorizedClientRepository = oAuth2AuthorizedClientRepository;

  }

  @GetMapping("")
  public String getAllOrders(Model model, @AuthenticationPrincipal OAuth2User principal,
      @AuthenticationPrincipal OidcUser principalOidcUser) {

    if (principal != null) {
      String name = principal.getAttribute("name");
      model.addAttribute("name", name);
    }
    OidcIdToken idToken = principalOidcUser.getIdToken(); //Contain only info for user.
    OidcUserInfo userInfo = principalOidcUser.getUserInfo();

    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    OAuth2AuthenticationToken token = (OAuth2AuthenticationToken) authentication;

    //Retrieve authorized client(may by like cu-mvc-web-app, google, facebook, github) for the specified clientRegistrationId and
    // principalName
    //There is case to be handled. When app is restart it looses OAuth2AuthorizedClient.
    // For google this not work in this manner.
    OAuth2AuthorizedClient oAuth2AuthorizedClient = oAuth2AuthorizedClientService.loadAuthorizedClient(
        token.getAuthorizedClientRegistrationId(), principal.getAttribute("name"));

    return "home";
  }

}
