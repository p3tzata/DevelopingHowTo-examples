package com.example.springmicroservicewebserver.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
    prePostEnabled = true, //if we want to use @PreAuthorize and @PostAuthorize - annotation.
    securedEnabled = true, //if we want to use @Secure - annotation.
    jsr250Enabled = true)
public class WebConfig {

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

    JwtAuthenticationConverter jwtConverter = new JwtAuthenticationConverter();
    jwtConverter.setJwtGrantedAuthoritiesConverter(new JWTConverter());
    http
        .authorizeHttpRequests((authz) -> authz
            .anyRequest().authenticated()
        )
        //.formLogin(FormLoginConfigurer::disable)

        .oauth2ResourceServer(
            httpSecurityOAuth2ResourceServerConfigurer ->
                httpSecurityOAuth2ResourceServerConfigurer.jwt(
                    jwtConfigurer ->
                    {
                      jwtConfigurer.jwtAuthenticationConverter(source -> jwtConverter.convert(source));

                    }

                )
        );

    return http.build();
  }


}
