# Depends:

- mocks
- `spa-angular-no-cu/app`
- `eureka-discovery-server`
- `resource-server (GET http://127.0.0.1:8002/order/getAll)`

# See

### Configuration


## 1. Keycloak:
  - client - `cu-spa-angular`

## 2. Angular App
- dependencies in `app/package.json`:
  - `angular-oauth2-oidc`
- app.module.ts:
  - import `OAuthModule`, `HttpClientModule`
- app.components.ts
  - `configure()`
- configuration
  - `MyOAuth2.config.ts`
  - `MyOAuth2TokenInterceptor.ts`

## 3. Resource server
- `application.properties`
- `com.example.resourceserver.config.WebSecurity.configure`
- `com.example.resourceserver.config.WebSecurity.corsConfigurationSource`


# Action

### Manual test - Prepare npm

- trigger:
- see registry setting if you use some custom registry save url somewhere - `npm config list`
- reset to default registry setting - `npm config delete registry`
- observe:

# Help

- start app - `ng s`
