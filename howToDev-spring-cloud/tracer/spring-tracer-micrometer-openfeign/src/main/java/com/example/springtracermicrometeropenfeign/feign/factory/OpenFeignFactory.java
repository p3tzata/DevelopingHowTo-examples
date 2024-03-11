package com.example.springtracermicrometeropenfeign.feign.factory;

import com.example.springtracermicrometeropenfeign.feign.MyRestClient;
import feign.Feign;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import feign.Retryer;
import feign.httpclient.ApacheHttpClient;
import feign.jackson.JacksonDecoder;
import feign.jackson.JacksonEncoder;
import feign.micrometer.MicrometerObservationCapability;
import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.observation.ObservationRegistry;
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
  private final MeterRegistry meterRegistry;

  private ObservationRegistry observationRegistry;

  private MicrometerObservationCapability micrometerObservationCapability;

  @Autowired
  public OpenFeignFactory(OAuth2AccessTokenInterceptor oAuth2AccessTokenInterceptor,
      FeignContentGzipEncodingInterceptor feignContentGzipEncodingInterceptor, MeterRegistry meterRegistry,
      ObservationRegistry observationRegistry) {

    this.oAuth2AccessTokenInterceptor = oAuth2AccessTokenInterceptor;
    this.feignContentGzipEncodingInterceptor = feignContentGzipEncodingInterceptor;
    this.meterRegistry = meterRegistry;
    this.observationRegistry = observationRegistry;
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

        //readMe: add micrometer support to feign, inspired by https://github.com/spring-cloud/spring-cloud-openfeign/blob/4ffd384030f699604a185ecdb46584508b99f43a/docs/modules/ROOT/pages/spring-cloud-openfeign.adoc#creating-feign-clients-manually
        .addCapability(new MicrometerObservationCapability(observationRegistry))
        .target(targetType, targetUrl);

  }

  private class MyHeaderInterceptor implements RequestInterceptor {

    public MyHeaderInterceptor() {

    }

    @Override
    public void apply(final RequestTemplate template) {

      template.header("X-MyHeader", "myValue");

    }
  }
}
