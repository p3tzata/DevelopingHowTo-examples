import {Injectable} from '@angular/core';
import {
  HttpInterceptor,
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpErrorResponse,
} from '@angular/common/http';
import {from, Observable, throwError} from 'rxjs';
import {catchError, switchMap, filter, take} from 'rxjs/operators';
import {OAuthService} from 'angular-oauth2-oidc';

@Injectable()
export class MyOAuth2TokenInterceptor implements HttpInterceptor {
  constructor(private oauthService: OAuthService) {
  }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => {
        if (error.status === 401) {
          console.log("Token has expired or is invalid. Attempt to refresh the token.");
          return this.handleTokenRefresh(request, next);
        }
        return throwError(error);
      })
    );
  }

  private handleTokenRefresh(
    originalRequest: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {

    //if (this.oauthService.hasValidAccessToken() && this.oauthService.hasValidIdToken()) {
    //  console.log("Token is still valid, no need to refresh");
    //  return throwError('Access token is still valid.');
    //}

    //console.log('Old access token:', this.oauthService.getAccessToken());

    return from(this.oauthService.refreshToken()).pipe(
      switchMap(() => {
        console.log("Token refresh successful, retry the original request");
        //console.log('New access token:', this.oauthService.getAccessToken());
        const newAccessToken = this.oauthService.getAccessToken();

        // Clone the original request and set the new access token in the 'Authorization' header
        const modifiedRequest = originalRequest.clone({
          setHeaders: {
            Authorization: `Bearer ${newAccessToken}`
          }
        });
        return next.handle(modifiedRequest);
      }),
      catchError((refreshError) => {
        console.log("Token refresh failed, handle the error (e.g., log out the user)");
        console.error('Token refresh error:', refreshError);
        this.redirectToKeycloakLogin();
        return throwError(refreshError);

      })
    );
  }

  private redirectToKeycloakLogin() {
    // Redirect to the Keycloak login URL
    this.oauthService.initLoginFlow();
  }

}
