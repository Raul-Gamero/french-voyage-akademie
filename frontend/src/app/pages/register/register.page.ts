import { Component, inject, signal } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonCheckbox,
  IonContent,
  IonHeader,
  IonInput,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { AuthService } from '../../core/auth.service';
import { LanguageService } from '../../core/language.service';

@Component({
  selector: 'fva-register',
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
    IonCheckbox,
    IonButton,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-back-button defaultHref="/" /></ion-buttons>
        <ion-title>{{ 'register.title' | translate }}</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <form class="mx-auto max-w-md" #form="ngForm" (ngSubmit)="submit(form)" novalidate>
        <p class="mb-5 text-sm opacity-75">{{ 'register.intro' | translate }}</p>

        <ion-input
          name="displayName"
          autocomplete="nickname"
          fill="outline"
          class="mb-4"
          required
          minlength="2"
          maxlength="80"
          [label]="'register.displayName' | translate"
          labelPlacement="stacked"
          [helperText]="'register.displayNameHelp' | translate"
          [(ngModel)]="displayName"
        />

        <ion-input
          type="email"
          name="email"
          autocomplete="email"
          inputmode="email"
          fill="outline"
          class="mb-4"
          required
          [label]="'register.email' | translate"
          labelPlacement="stacked"
          [(ngModel)]="email"
        />

        <ion-input
          type="password"
          name="password"
          autocomplete="new-password"
          fill="outline"
          class="mb-4"
          required
          minlength="8"
          [label]="'register.password' | translate"
          labelPlacement="stacked"
          [helperText]="'register.passwordHelp' | translate"
          [(ngModel)]="password"
        />

        <ion-checkbox
          class="mb-5"
          labelPlacement="end"
          justify="start"
          name="consent"
          [(ngModel)]="privacyConsent"
        >
          <span class="text-sm">{{ 'register.consent' | translate }}</span>
        </ion-checkbox>

        <p class="mb-5 text-xs opacity-70">
          <a routerLink="/legal/privacy">{{ 'nav.privacy' | translate }}</a>
          ·
          <a routerLink="/legal/terms">{{ 'nav.terms' | translate }}</a>
        </p>

        @if (error(); as errorKey) {
          <p role="alert" class="mb-4 rounded-lg bg-red-50 p-3 text-sm text-red-800">
            {{ errorKey | translate }}
          </p>
        }

        <ion-button type="submit" expand="block" [disabled]="loading()">
          @if (loading()) {
            <ion-spinner name="dots" [attr.aria-label]="'common.loading' | translate" />
          } @else {
            {{ 'register.submit' | translate }}
          }
        </ion-button>

        <p class="mt-6 text-center text-sm">
          {{ 'register.haveAccount' | translate }}
          <a routerLink="/login" class="font-semibold">{{ 'nav.login' | translate }}</a>
        </p>
      </form>
    </ion-content>
  `
})
export class RegisterPage {
  private readonly auth = inject(AuthService);
  private readonly router = inject(Router);
  private readonly language = inject(LanguageService);

  displayName = '';
  email = '';
  password = '';
  privacyConsent = false;

  readonly loading = signal(false);
  readonly error = signal<string | null>(null);

  submit(form: NgForm): void {
    if (this.loading()) {
      return;
    }

    if (!this.privacyConsent) {
      this.error.set('register.consentRequired');
      return;
    }

    if (form.invalid) {
      this.error.set('register.checkFields');
      return;
    }

    this.loading.set(true);
    this.error.set(null);

    this.auth
      .register({
        email: this.email.trim(),
        password: this.password,
        displayName: this.displayName.trim(),
        interfaceLocale: this.language.current(),
        privacyConsent: true
      })
      .subscribe({
        next: () => {
          this.loading.set(false);
          void this.router.navigateByUrl('/learn/A1');
        },
        error: (response: { status?: number }) => {
          this.loading.set(false);
          this.error.set(
            response.status === 409
              ? 'register.emailTaken'
              : response.status === 400
                ? 'register.checkFields'
                : 'common.networkError'
          );
        }
      });
  }
}
