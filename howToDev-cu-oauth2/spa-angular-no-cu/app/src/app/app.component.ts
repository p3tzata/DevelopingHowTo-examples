import {Component} from '@angular/core';
import {NullValidationHandler, OAuthService} from "angular-oauth2-oidc";
import {authConfig, well_known_url} from './myOAuth2.config'
import {HttpClient} from "@angular/common/http";
import {catchError, tap} from "rxjs";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';
  orders: Object = {};

  constructor(private oauthService: OAuthService, private http: HttpClient) {
    this.configure();
  }

  private configure() {
    this.oauthService.configure(authConfig);
    //this.oauthService.tokenValidationHandler = new NullValidationHandler();
    this.oauthService.loadDiscoveryDocumentAndTryLogin().then(x=>console.log(x));

    //THIS IS VERY BAD IDEA!!!!!!!
    //this.oauthService.events.subscribe(e => {
    //   if (e.type === "token_expires") {
    //   this.refreshToken();
    //  }
    // });

  }

  public login() {
    this.oauthService.initLoginFlow();
  }

  public logoff() {
    this.oauthService.logOut();
  }

  public getOrder() {
    const url = "http://localhost:8002/order/getAll";
    return this.http.get<Object>(url).subscribe(x => {
        this.orders = x;
      }
    );
  }

  private refreshToken() {

    this.oauthService.refreshToken()
    .then(() => {
      console.log("Successfully refresh token!!!");
    })
    .catch(error => {
      // Handle token refresh error

    });
  }


}
