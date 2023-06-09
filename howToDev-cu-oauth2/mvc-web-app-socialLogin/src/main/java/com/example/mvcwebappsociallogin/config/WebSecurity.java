package com.example.mvcwebappsociallogin.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.client.oidc.web.logout.OidcClientInitiatedLogoutSuccessHandler;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;

//#cu_configureWebSecurity
@EnableWebSecurity
@EnableGlobalMethodSecurity(
    prePostEnabled = true, //if we want to use @PreAuthorize and @PostAuthorize - annotation.
    securedEnabled = true, //if we want to use @Secure - annotation.
    jsr250Enabled = true)
public class WebSecurity extends WebSecurityConfigurerAdapter {

  @Autowired
  ClientRegistrationRepository clientRegistrationRepository;

  /**
   * This is OidcClientInitiatedLogoutSuccessHandler is needed because when we do simple logout
   * session is not ended on authorization server, BUT this not work on Google oauth2 client
   * */
  private OidcClientInitiatedLogoutSuccessHandler oidcLogoutSuccessHandler() {
    OidcClientInitiatedLogoutSuccessHandler successHandler = new OidcClientInitiatedLogoutSuccessHandler(clientRegistrationRepository);
    successHandler.setPostLogoutRedirectUri("http://localhost:8006/");
    return successHandler;
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    http.authorizeRequests((requests) -> requests.antMatchers("/").permitAll());

    http.authorizeRequests((requests) -> {
      try {
        //Without oauth2Login() spring won't redirect us to keycloack login page.
        requests.anyRequest().authenticated()
            .and().oauth2Login()
            .and().logout()
            //.logoutSuccessUrl("/")
            .logoutSuccessHandler(oidcLogoutSuccessHandler())
            .invalidateHttpSession(true)
            .clearAuthentication(true)
            .deleteCookies("JSESSIONID");
      }
      catch (Exception e) {
        throw new RuntimeException(e);
      }
    });

  }
}
