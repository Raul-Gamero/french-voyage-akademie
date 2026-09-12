import { HttpClient } from '@angular/common/http';
import { Injectable, computed, inject, signal } from '@angular/core';
import { Observable, tap } from 'rxjs';

import { environment } from '../../environments/environment';
import { AuthResponse, Locale, UserProfile } from './models';

const TOKEN_KEY = 'fva.token';
const USER_KEY = 'fva.user';

/**
 * Session de l'apprenant.
 *
 * <p>Le jeton est conservé dans le stockage local afin que l'application
 * reste utilisable après un redémarrage du téléphone et hors connexion —
 * contrainte assumée pour un public qui étudie dans les transports.</p>
 */
@Injectable({ providedIn: 'root' })
export class AuthService {
  private readonly http = inject(HttpClient);

  private readonly currentUser = signal<UserProfile | null>(this.restoreUser());
  private readonly token = signal<string | null>(this.restoreToken());

  readonly user = this.currentUser.asReadonly();
  readonly isAuthenticated = computed(() => this.token() !== null);

  register(payload: {
    email: string;
    password: string;
    displayName: string;
    interfaceLocale: Locale;
    privacyConsent: boolean;
  }): Observable<AuthResponse> {
    return this.http
      .post<AuthResponse>(`${environment.apiUrl}/auth/register`, payload)
      .pipe(tap((response) => this.persist(response)));
  }

  login(email: string, password: string): Observable<AuthResponse> {
    return this.http
      .post<AuthResponse>(`${environment.apiUrl}/auth/login`, { email, password })
      .pipe(tap((response) => this.persist(response)));
  }

  logout(): void {
    this.token.set(null);
    this.currentUser.set(null);
    this.safeRemove(TOKEN_KEY);
    this.safeRemove(USER_KEY);
  }

  accessToken(): string | null {
    return this.token();
  }

  updateUser(user: UserProfile): void {
    this.currentUser.set(user);
    this.safeWrite(USER_KEY, JSON.stringify(user));
  }

  private persist(response: AuthResponse): void {
    this.token.set(response.accessToken);
    this.currentUser.set(response.user);
    this.safeWrite(TOKEN_KEY, response.accessToken);
    this.safeWrite(USER_KEY, JSON.stringify(response.user));
  }

  private restoreToken(): string | null {
    return this.safeRead(TOKEN_KEY);
  }

  private restoreUser(): UserProfile | null {
    const raw = this.safeRead(USER_KEY);
    if (!raw) {
      return null;
    }
    try {
      return JSON.parse(raw) as UserProfile;
    } catch {
      // Donnée corrompue : on repart d'une session vide plutôt que de planter.
      this.safeRemove(USER_KEY);
      return null;
    }
  }

  // Le stockage local peut lever une exception en navigation privée ou
  // lorsque le navigateur bloque les données de site : l'application doit
  // continuer de fonctionner, simplement sans se souvenir de la session.
  private safeRead(key: string): string | null {
    try {
      return localStorage.getItem(key);
    } catch {
      return null;
    }
  }

  private safeWrite(key: string, value: string): void {
    try {
      localStorage.setItem(key, value);
    } catch {
      /* session non persistée : sans conséquence sur l'usage courant */
    }
  }

  private safeRemove(key: string): void {
    try {
      localStorage.removeItem(key);
    } catch {
      /* rien à faire */
    }
  }
}
