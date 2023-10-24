import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {OAuthModule} from 'angular-oauth2-oidc'
import {oAuthModuleConfig} from './myOAuth2.config'
import {HTTP_INTERCEPTORS, HttpClientModule} from "@angular/common/http";
import {MyOAuth2TokenInterceptor} from "./MyOAuth2TokenInterceptor";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    OAuthModule.forRoot(oAuthModuleConfig)
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: MyOAuth2TokenInterceptor,
    multi: true,
  }],
  bootstrap: [AppComponent]
})
export class AppModule {
}
