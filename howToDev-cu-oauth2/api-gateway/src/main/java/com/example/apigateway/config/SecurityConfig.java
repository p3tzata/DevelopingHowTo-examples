package com.example.apigateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.jwt.ReactiveJwtDecoder;
import org.springframework.security.oauth2.jwt.ReactiveJwtDecoders;

@Configuration
public class SecurityConfig {

  //Not tested
  @Bean
  public ReactiveJwtDecoder jwtDecoder() {
    String issuerUri = "http://localhost:8001/auth/realms/myRealm";
    return ReactiveJwtDecoders.fromIssuerLocation(issuerUri);
  }

/* I don't know what is this for
  @Bean
  SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http) {
    http
        .authorizeExchange(exchanges -> exchanges
            .anyExchange().authenticated()
        )
        .oauth2ResourceServer(oauth2 -> oauth2
            .jwt(Customizer.withDefaults()));
    return http.build();
  }
  */
}
