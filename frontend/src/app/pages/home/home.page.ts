import { Component, OnInit, inject, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonMenuButton,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { ApiService } from '../../core/api.service';
import { AuthService } from '../../core/auth.service';
import { LevelSummary } from '../../core/models';

@Component({
  selector: 'fva-home',
  standalone: true,
  imports: [
    RouterLink,
    TranslateModule,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonMenuButton,
    IonContent,
    IonButton,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-menu-button /></ion-buttons>
        <ion-title>French Voyage Akademie</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <section class="mx-auto max-w-reading pb-6">
        <h1 class="mt-2 text-3xl font-bold leading-tight">{{ 'home.title' | translate }}</h1>
        <p class="mt-3 text-base opacity-80">{{ 'home.subtitle' | translate }}</p>

        <div class="mt-6 flex flex-wrap gap-3">
          <ion-button routerLink="/learn/A1">{{ 'home.startLearning' | translate }}</ion-button>
          @if (!auth.isAuthenticated()) {
            <ion-button fill="outline" routerLink="/register">
              {{ 'home.createAccount' | translate }}
            </ion-button>
          } @else {
            <ion-button fill="outline" routerLink="/progress">
              {{ 'nav.progress' | translate }}
            </ion-button>
          }
        </div>

        <ul class="mt-8 space-y-2 text-sm opacity-80">
          <li>✓ {{ 'home.promise.free' | translate }}</li>
          <li>✓ {{ 'home.promise.noAds' | translate }}</li>
          <li>✓ {{ 'home.promise.offline' | translate }}</li>
          <li>✓ {{ 'home.promise.openSource' | translate }}</li>
        </ul>
      </section>

      <section class="mx-auto max-w-reading" aria-labelledby="levels-heading">
        <h2 id="levels-heading" class="mb-3 text-xl font-semibold">
          {{ 'home.levels' | translate }}
        </h2>

        @if (loading()) {
          <div class="flex justify-center py-8">
            <ion-spinner [attr.aria-label]="'common.loading' | translate" />
          </div>
        } @else if (error()) {
          <p role="alert" class="rounded-lg bg-red-50 p-4 text-sm text-red-800">
            {{ 'common.loadError' | translate }}
          </p>
        } @else {
          <ul class="grid gap-3 sm:grid-cols-2">
            @for (level of levels(); track level.code) {
              <li>
                @if (level.published) {
                  <a
                    [routerLink]="['/learn', level.code]"
                    class="block rounded-xl border border-voyage-200 p-4 no-underline transition hover:border-voyage-500"
                  >
                    <span class="text-lg font-semibold text-voyage-600">{{ level.name }}</span>
                    <p class="mt-1 text-sm opacity-75">{{ level.description }}</p>
                    <p class="mt-2 text-xs opacity-60">
                      {{ 'home.lessonCount' | translate: { count: level.lessonCount } }}
                    </p>
                  </a>
                } @else {
                  <div class="rounded-xl border border-dashed border-gray-300 p-4 opacity-60">
                    <span class="text-lg font-semibold">{{ level.name }}</span>
                    <p class="mt-1 text-sm">{{ level.description }}</p>
                    <p class="mt-2 text-xs font-medium">{{ 'home.comingSoon' | translate }}</p>
                  </div>
                }
              </li>
            }
          </ul>
        }
      </section>

      <footer class="mx-auto mt-10 max-w-reading border-t pt-4 text-xs opacity-70">
        <p>{{ 'home.disclaimer' | translate }}</p>
        <p class="mt-2">
          <a routerLink="/legal/terms">{{ 'nav.terms' | translate }}</a>
          ·
          <a routerLink="/legal/privacy">{{ 'nav.privacy' | translate }}</a>
        </p>
      </footer>
    </ion-content>
  `
})
export class HomePage implements OnInit {
  private readonly api = inject(ApiService);
  readonly auth = inject(AuthService);

  readonly levels = signal<LevelSummary[]>([]);
  readonly loading = signal(true);
  readonly error = signal(false);

  ngOnInit(): void {
    this.api.listLevels().subscribe({
      next: (levels) => {
        this.levels.set(levels);
        this.loading.set(false);
      },
      error: () => {
        this.error.set(true);
        this.loading.set(false);
      }
    });
  }
}
