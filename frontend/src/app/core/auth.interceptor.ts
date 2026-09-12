import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';

import { AuthService } from './auth.service';

/**
 * Ajoute le jeton aux appels de l'API et ferme la session sur un 401.
 *
 * <p>Un 401 signifie que le jeton a expiré ou que le compte a disparu :
 * plutôt que de laisser l'apprenant devant des pages vides, on nettoie la
 * session et on renvoie vers la connexion.</p>
 */
export const authInterceptor: HttpInterceptorFn = (request, next) => {
  const auth = inject(AuthService);
  const router = inject(Router);
  const token = auth.accessToken();

  const authorised = token
    ? request.clone({ setHeaders: { Authorization: `Bearer ${token}` } })
    : request;

  return next(authorised).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error.status === 401 && auth.accessToken()) {
        auth.logout();
        void router.navigate(['/login'], { queryParams: { session: 'expired' } });
      }
      return throwError(() => error);
    })
  );
};
