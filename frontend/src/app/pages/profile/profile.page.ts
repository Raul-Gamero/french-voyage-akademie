import { Component, OnInit, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInput,
  IonMenuButton,
  IonNote,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { ApiService } from '../../core/api.service';
import { AuthService } from '../../core/auth.service';
import { LanguageService } from '../../core/language.service';
import { LanguageSwitcherComponent } from '../../shared/language-switcher.component';

@Component({
  selector: 'fva-profile',
  standalone: true,
  imports: [
    FormsModule,
    TranslateModule,
    LanguageSwitcherComponent,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonMenuButton,
    IonContent,
    IonInput,
    IonButton,
    IonNote
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-menu-button /></ion-buttons>
        <ion-title>{{ 'profile.title' | translate }}</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <div class="mx-auto max-w-md">
        @if (message(); as messageKey) {
          <p role="status" class="mb-4 rounded-lg bg-green-50 p-3 text-sm text-green-900">
            {{ messageKey | translate }}
          </p>
        }
        @if (error(); as errorKey) {
          <p role="alert" class="mb-4 rounded-lg bg-red-50 p-3 text-sm text-red-800">
            {{ errorKey | translate }}
          </p>
        }

        <!-- Identité -->
        <section class="mb-8" aria-labelledby="identity-heading">
          <h2 id="identity-heading" class="mb-3 text-lg font-semibold">
            {{ 'profile.identity' | translate }}
          </h2>

          <ion-input
            fill="outline"
            class="mb-3"
            [label]="'profile.email' | translate"
            labelPlacement="stacked"
            [value]="auth.user()?.email"
            [readonly]="true"
          />
          <ion-note class="mb-4 block text-xs">{{ 'profile.emailFixed' | translate }}</ion-note>

          <ion-input
            name="displayName"
            fill="outline"
            class="mb-4"
            [label]="'profile.displayName' | translate"
            labelPlacement="stacked"
            [(ngModel)]="displayName"
          />

          <ion-button expand="block" (click)="saveProfile()">
            {{ 'profile.save' | translate }}
          </ion-button>
        </section>

        <!-- Langue -->
        <section class="mb-8" aria-labelledby="language-heading">
          <h2 id="language-heading" class="mb-3 text-lg font-semibold">
            {{ 'profile.language' | translate }}
          </h2>
          <fva-language-switcher />
        </section>

        <!-- Mot de passe -->
        <section class="mb-8" aria-labelledby="password-heading">
          <h2 id="password-heading" class="mb-3 text-lg font-semibold">
            {{ 'profile.changePassword' | translate }}
          </h2>

          <ion-input
            type="password"
            name="currentPassword"
            autocomplete="current-password"
            fill="outline"
            class="mb-3"
            [label]="'profile.currentPassword' | translate"
            labelPlacement="stacked"
            [(ngModel)]="currentPassword"
          />
          <ion-input
            type="password"
            name="newPassword"
            autocomplete="new-password"
            fill="outline"
            class="mb-4"
            [label]="'profile.newPassword' | translate"
            labelPlacement="stacked"
            [(ngModel)]="newPassword"
          />

          <ion-button expand="block" fill="outline" (click)="changePassword()">
            {{ 'profile.updatePassword' | translate }}
          </ion-button>
        </section>

        <!-- Droits RGPD -->
        <section class="rounded-xl border border-red-200 p-4" aria-labelledby="danger-heading">
          <h2 id="danger-heading" class="mb-2 text-lg font-semibold text-accent-600">
            {{ 'profile.deleteAccount' | translate }}
          </h2>
          <p class="mb-4 text-sm opacity-80">{{ 'profile.deleteWarning' | translate }}</p>

          @if (!confirmingDelete()) {
            <ion-button expand="block" color="danger" fill="outline" (click)="confirmingDelete.set(true)">
              {{ 'profile.deleteAccount' | translate }}
            </ion-button>
          } @else {
            <p class="mb-3 text-sm font-semibold">{{ 'profile.deleteConfirm' | translate }}</p>
            <div class="flex gap-2">
              <ion-button color="danger" (click)="deleteAccount()">
                {{ 'profile.deleteYes' | translate }}
              </ion-button>
              <ion-button fill="clear" (click)="confirmingDelete.set(false)">
                {{ 'common.cancel' | translate }}
              </ion-button>
            </div>
          }
        </section>
      </div>
    </ion-content>
  `
})
export class ProfilePage implements OnInit {
  private readonly api = inject(ApiService);
  private readonly router = inject(Router);
  private readonly language = inject(LanguageService);
  readonly auth = inject(AuthService);

  displayName = '';
  currentPassword = '';
  newPassword = '';

  readonly message = signal<string | null>(null);
  readonly error = signal<string | null>(null);
  readonly confirmingDelete = signal(false);

  ngOnInit(): void {
    this.displayName = this.auth.user()?.displayName ?? '';

    // Le profil local peut dater : on le rafraîchit depuis le serveur.
    this.api.getProfile().subscribe({
      next: (profile) => {
        this.auth.updateUser(profile);
        this.displayName = profile.displayName;
      },
      error: () => {
        /* le profil en cache reste affiché */
      }
    });
  }

  saveProfile(): void {
    this.reset();
    this.api.updateProfile(this.displayName.trim(), this.language.current()).subscribe({
      next: (profile) => {
        this.auth.updateUser(profile);
        this.message.set('profile.saved');
      },
      error: () => this.error.set('common.networkError')
    });
  }

  changePassword(): void {
    this.reset();
    if (this.newPassword.length < 8) {
      this.error.set('profile.passwordTooShort');
      return;
    }

    this.api.changePassword(this.currentPassword, this.newPassword).subscribe({
      next: () => {
        this.currentPassword = '';
        this.newPassword = '';
        this.message.set('profile.passwordChanged');
      },
      error: (response: { status?: number }) =>
        this.error.set(response.status === 409 ? 'profile.wrongPassword' : 'common.networkError')
    });
  }

  deleteAccount(): void {
    this.api.deleteAccount().subscribe({
      next: () => {
        this.auth.logout();
        void this.router.navigateByUrl('/');
      },
      error: () => this.error.set('common.networkError')
    });
  }

  private reset(): void {
    this.message.set(null);
    this.error.set(null);
  }
}
