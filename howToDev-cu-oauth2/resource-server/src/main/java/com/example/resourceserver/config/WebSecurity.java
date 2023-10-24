package com.example.resourceserver.config;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

//#cu_configureWebSecurity
@EnableWebSecurity
@EnableGlobalMethodSecurity(
    prePostEnabled = true, //if we want to use @PreAuthorize and @PostAuthorize - annotation.
    securedEnabled = true, //if we want to use @Secure - annotation.
    jsr250Enabled = true)
public class WebSecurity extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    //We register our JWTConverter.
    JwtAuthenticationConverter jwtConverter = new JwtAuthenticationConverter();
    jwtConverter.setJwtGrantedAuthoritiesConverter(new JWTConverter());

    //Only accept if jwt has profile scope.
    http.authorizeRequests(
        (requests) -> requests.antMatchers(HttpMethod.GET, "/testController/token_hasScopeProfile").hasAuthority(
            "SCOPE_profile69"));

    http.authorizeRequests((requests) -> requests.antMatchers(HttpMethod.GET, "/testController/token_hasRoleCu-user").hasRole(
        "cu-user"));

    http.authorizeRequests((requests) -> requests.anyRequest().authenticated());

    http.oauth2ResourceServer()
        .jwt()// you are telling Spring Security that your resource server should expect JWTs as the access token format for requests that require authentication.
        .jwtAuthenticationConverter(jwtConverter); //Register our jwtConverter
//#cu CORS
 http.cors();
  }

  //#cu CORS configuration
  @Bean
  CorsConfigurationSource corsConfigurationSource() {
    /**
     * Because our SPA app has different origin { http://localhost:8007(spa) <==> http://127.0.0.1:8002(api) }
     *  This CorsConfigurationSource is used by http.cors()
     *  This is needed not use API gateway.
     *  Cors must be configured either on API gateway or resource-server - not on both.
    */
    CorsConfiguration corsConfiguration = new CorsConfiguration();
    corsConfiguration.setAllowedOrigins(List.of("http://localhost:8007","http://localhost:4200"));
    corsConfiguration.setAllowedHeaders(List.of("*"));
    corsConfiguration.setAllowedMethods(List.of("GET"));
    UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
    urlBasedCorsConfigurationSource.registerCorsConfiguration("/**",corsConfiguration);
    return urlBasedCorsConfigurationSource;

  }

}
