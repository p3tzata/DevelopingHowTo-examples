package com.example.resourceserver.config;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;

public class JWTConverter implements Converter<Jwt, Collection<GrantedAuthority>> {

  @Override
  public Collection<GrantedAuthority> convert(Jwt source) {

    Collection<GrantedAuthority> result = new ArrayList<>();

    Map<String, Object> realm_access = (Map<String, Object>) source.getClaims().get("realm_access");
    if (realm_access==null || realm_access.isEmpty()) {
      return result;
    }

     result = ((List<String>) realm_access.get("roles")).stream().map(x -> "ROLE_" + x)
        .map(SimpleGrantedAuthority::new)
        .collect(Collectors.toList());

    return result;
  }

}
