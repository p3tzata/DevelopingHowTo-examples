package com.example.resourceserver.controller;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//#cu_restControllerTester
@RestController
@RequestMapping("/testController")
public class testController {

  @GetMapping("/token")
  public String getToken(@AuthenticationPrincipal Jwt token) {

    return token.getTokenValue();
  }

  @GetMapping("/token_hasScopeProfile69")
  public String getToken_hasScope(@AuthenticationPrincipal Jwt token) {

    return token.getTokenValue();
  }

  @GetMapping("/token_hasRoleCu-user")
  public String getToken_token_hasRoleCuUser(@AuthenticationPrincipal Jwt token) {

    return token.getTokenValue();
  }

  //# @PreAuthorize support some expression for access control also can be used "#userId_ == #token_.subject"
  //subject is from a 'sub' claim. #someVar is getting from input param of the method.

  @PreAuthorize("hasRole('superAdmin') or #userId_ == #token_.subject")
  @GetMapping("/token_getProfile/{userId_}")
  public String getToken_hasRoleSuperAdminOrUserItself(@AuthenticationPrincipal Jwt token_, @PathVariable String userId_) {

    return token_.getTokenValue();
  }

  //This will return to user only if is true. Also, can be used #someVar
  @PostAuthorize("returnObject.toUpperCase().equals('TEST_')")
  @GetMapping("/token_getProfilePostAuthorize/{userId_}")
  public String getToken_getProfilePostAuthorize(@AuthenticationPrincipal Jwt token_, @PathVariable String userId_) {

    return "test_";
  }



}
