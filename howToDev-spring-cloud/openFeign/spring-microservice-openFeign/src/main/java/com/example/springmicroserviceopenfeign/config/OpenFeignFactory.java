package com.example.springmicroserviceopenfeign.config;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.encoding.FeignContentGzipEncodingInterceptor;
import org.springframework.cloud.openfeign.security.OAuth2AccessTokenInterceptor;
import org.springframework.stereotype.Component;

@Component
public class OpenFeignFactory {

  private final OAuth2AccessTokenInterceptor oAuth2AccessTokenInterceptor;
  private final FeignContentGzipEncodingInterceptor feignContentGzipEncodingInterceptor;

  @Autowired
  public OpenFeignFactory(OAuth2AccessTokenInterceptor oAuth2AccessTokenInterceptor,
      FeignContentGzipEncodingInterceptor feignContentGzipEncodingInterceptor) {

    this.oAuth2AccessTokenInterceptor = oAuth2AccessTokenInterceptor;
    this.feignContentGzipEncodingInterceptor = feignContentGzipEncodingInterceptor;
  }


}
