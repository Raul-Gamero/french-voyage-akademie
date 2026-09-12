import { Component, OnInit, inject, signal } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInput,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { AuthService } from '../../core/auth.service';

@Component({
  selector: 'fva-login',
  standalone: true,
  imports: [
    FormsModule,
    RouterLink,
    TranslateModule,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonBackButton,
    IonContent,
    IonInput,
    IonButton,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-back-button defaultHref="/" /></ion-buttons>
        <ion-title>{{ 'login.title' | translate }}</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <form class="mx-auto max-w-md" #form="ngForm" (ngSubmit)="submit(form)" novalidate>
        @if (sessionExpired()) {
          <p role="status" class="mb-4 rounded-lg bg-amber-50 p-3 text-sm text-amber-900">
            {{ 'login.sessionExpired' | translate }}
          </p>
        }

        <ion-input
          type="email"
          name="email"
          autocomplete="email"
          inputmode="email"
          fill="outline"
          class="mb-4"
          required
          [label]="'login.email' | translate"
          labelPlacement="stacked"
          [(ngModel)]="email"
        />

        <ion-input
          type="password"
          name="password"
          autocomplete="current-password"
          fill="outline"
          class="mb-4"
          required
          [label]="'login.password' | translate"
          labelPlacement="stacked"
          [(ngModel)]="password"
        />

        @if (error(); as errorKey) {
          <p role="alert" class="mb-4 rounded-lg bg-red-50 p-3 text-sm text-red-800">
            {{ errorKey | translate }}
          </p>
        }

        <ion-button type="submit" expand="block" [disabled]="loading()">
          @if (loading()) {
            <ion-spinner name="dots" [attr.aria-label]="'common.loading' | translate" />
          } @else {
            {{ 'login.submit' | translate }}
          }
        </ion-button>

        <p class="mt-6 text-center text-sm">
          {{ 'login.noAccount' | translate }}
          <a routerLink="/register" class="font-semibold">{{ 'login.createOne' | translate }}</a>
        </p>
      </form>
    </ion-content>
  `
})
export class LoginPage implements OnInit {
  private readonly auth = inject(AuthService);
  private readonly router = inject(Router);
  private readonly route = inject(ActivatedRoute);

  email = '';
  password = '';

  readonly loading = signal(false);
  readonly error = signal<string | null>(null);
  readonly sessionExpired = signal(false);

  private redirect = '/progress';

  ngOnInit(): void {
    const params = this.route.snapshot.queryParamMap;
    this.redirect = params.get('redirect') ?? '/progress';
    this.sessionExpired.set(params.get('session') === 'expired');
  }

  submit(form: NgForm): void {
    if (form.invalid || this.loading()) {
      this.error.set('login.missingFields');
      return;
    }

    this.loading.set(true);
    this.error.set(null);

    this.auth.login(this.email.trim(), this.password).subscribe({
      next: () => {
        this.loading.set(false);
        void this.router.navigateByUrl(this.redirect);
      },
      error: (response: { status?: number }) => {
        this.loading.set(false);
        // Un identifiant inconnu et un mot de passe faux donnent le même
        // message : ne pas révéler qu'un compte existe pour cette adresse.
        this.error.set(
          response.status === 401 ? 'login.invalidCredentials' : 'common.networkError'
        );
      }
    });
  }
}
