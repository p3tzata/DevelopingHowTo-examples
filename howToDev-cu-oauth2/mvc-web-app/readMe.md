# Mvc-web-app

- `	implementation 'org.springframework.boot:spring-boot-starter-oauth2-client'` - need for redirect user for username and
  password to IdP, enable to read tokens, communicate with resource server by including authorization header.
- `@AuthenticationPrincipal OidcUser principal` - inject authenticated user into method.
- `OAuth2AuthenticationToken token = (OAuth2AuthenticationToken) SecurityContextHolder.getContext().getAuthentication();` -
  get authenticate object and can be used somewhere
- `OAuth2AuthorizedClient oAuth2AuthorizedClient = oAuth2AuthorizedClientService.loadAuthorizedClient(token.
  getAuthorizedClientRegistrationId(), token.getName());` - retrieve OAuth2AuthorizedClient, but only until restart the app,
  after restart of app it's null if we use default repository(inMemory) implementation of `OAuth2AuthorizedClientRepository`

## WebClient

```
    //Applying filterFunction.oauth2Configuration() will attach access token on every single request. Which might not be the
    // desired behavior. So we have to not use this webClient to third party because our access token is exposed. 
    return WebClient.builder().apply(filterFunction.oauth2Configuration()).build();
```
