import {AuthConfig, OAuthModuleConfig} from 'angular-oauth2-oidc';

export const well_known_url: string = 'http://localhost:8001/auth/realms/myRealm/.well-known/openid-configuration'

export const oAuthModuleConfig: OAuthModuleConfig = {

  resourceServer: {
    allowedUrls: ['http://localhost:8002/'],
    sendAccessToken: true
  }
}

export const authConfig: AuthConfig = {

  issuer: "http://localhost:8001/auth/realms/myRealm",

  clientId: 'cu-spa-angular',

  //After login, the Authorization Server will redirect to this location
  redirectUri: window.location.origin,

  responseType: 'code',

  scope: 'openid profile email',

  showDebugInformation: true,

  // set to true, to receive also an id_token via OpenId Connect (OIDC) in addition to the
  // OAuth2-based access_token
  oidc: true,

  tokenEndpoint: "http://localhost:8001/auth/realms/myRealm/protocol/openid-connect/token"

}
