package com.example.springmicroserviceopenfeign.feign.factory;

import com.example.springmicroserviceopenfeign.feign.MyRestClient;
import feign.Feign;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import feign.Retryer;
import feign.httpclient.ApacheHttpClient;
import feign.jackson.JacksonDecoder;
import feign.jackson.JacksonEncoder;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.encoding.FeignContentGzipEncodingInterceptor;
import org.springframework.cloud.openfeign.security.OAuth2AccessTokenInterceptor;
import org.springframework.cloud.openfeign.support.ResponseEntityDecoder;
import org.springframework.cloud.openfeign.support.SpringMvcContract;
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

  public <T extends MyRestClient> T getMyRestClient(final Class<T> targetType, final String targetUrl) {

    final List<RequestInterceptor> requestInterceptors = new ArrayList<>();
    requestInterceptors.add(oAuth2AccessTokenInterceptor);
    requestInterceptors.add(new MyHeaderInterceptor());

    return Feign.builder()
        .contract(new SpringMvcContract())
        .requestInterceptors(requestInterceptors)
        .decoder(new ResponseEntityDecoder(new JacksonDecoder()))
        .encoder(new JacksonEncoder()).client(new ApacheHttpClient())
        .retryer(new Retryer.Default(500L, 5000L, 3))
        .target(targetType, targetUrl);

  }

  private class MyHeaderInterceptor implements RequestInterceptor {

    public MyHeaderInterceptor() {

    }

    @Override
    public void apply(final RequestTemplate template) {

      template.header("myHeader", "myValue");

    }
  }
}
