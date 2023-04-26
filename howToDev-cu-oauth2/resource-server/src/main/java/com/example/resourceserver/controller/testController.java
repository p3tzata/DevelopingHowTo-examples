package com.example.resourceserver.controller;

import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//#cu restController
@RestController
@RequestMapping("/testController")
public class testController {

  @GetMapping("/token")
  public String getToken(@AuthenticationPrincipal Jwt token) {
    return token.getTokenValue();
  }
}
