import { Component, OnInit, inject, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import {
  IonBadge,
  IonButtons,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonList,
  IonMenuButton,
  IonProgressBar,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { ApiService } from '../../core/api.service';
import { ProgressSummary } from '../../core/models';

@Component({
  selector: 'fva-progress',
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
    IonList,
    IonItem,
    IonLabel,
    IonBadge,
    IonProgressBar,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-menu-button /></ion-buttons>
        <ion-title>{{ 'progress.title' | translate }}</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      @if (loading()) {
        <div class="flex justify-center py-10">
          <ion-spinner [attr.aria-label]="'common.loading' | translate" />
        </div>
      } @else if (!summary()) {
        <p role="alert" class="rounded-lg bg-red-50 p-4 text-sm text-red-800">
          {{ 'common.loadError' | translate }}
        </p>
      } @else {
        <div class="mx-auto max-w-reading">
          <section class="mb-6 rounded-xl border p-4" aria-labelledby="overview-heading">
            <h2 id="overview-heading" class="mb-3 text-lg font-semibold">
              {{ 'progress.overview' | translate }}
            </h2>

            <ion-progress-bar
              [value]="summary()!.completionPercentage / 100"
              [attr.aria-label]="'progress.overallLabel' | translate"
            />

            <dl class="mt-4 grid grid-cols-2 gap-3 text-sm sm:grid-cols-4">
              <div>
                <dt class="opacity-60">{{ 'progress.completed' | translate }}</dt>
                <dd class="text-2xl font-bold">{{ summary()!.lessonsCompleted }}</dd>
              </div>
              <div>
                <dt class="opacity-60">{{ 'progress.inProgress' | translate }}</dt>
                <dd class="text-2xl font-bold">{{ summary()!.lessonsInProgress }}</dd>
              </div>
              <div>
                <dt class="opacity-60">{{ 'progress.available' | translate }}</dt>
                <dd class="text-2xl font-bold">{{ summary()!.lessonsAvailable }}</dd>
              </div>
              <div>
                <dt class="opacity-60">{{ 'progress.points' | translate }}</dt>
                <dd class="text-2xl font-bold">{{ summary()!.totalScore }}</dd>
              </div>
            </dl>
          </section>

          @if (summary()!.lessons.length === 0) {
            <p class="rounded-xl border border-dashed p-6 text-center text-sm opacity-75">
              {{ 'progress.empty' | translate }}
              <a routerLink="/learn/A1" class="font-semibold">{{ 'home.startLearning' | translate }}</a>
            </p>
          } @else {
            <h2 class="mb-2 text-lg font-semibold">{{ 'progress.byLesson' | translate }}</h2>
            <ion-list>
              @for (item of summary()!.lessons; track item.lessonId) {
                <ion-item [routerLink]="['/lesson', item.lessonSlug]" button [detail]="true">
                  <ion-label>
                    <h3>{{ item.lessonTitle }}</h3>
                    <p class="text-xs opacity-60">
                      {{ 'progress.score' | translate: { score: item.score, max: item.maxScore } }}
                    </p>
                  </ion-label>
                  <ion-badge
                    slot="end"
                    [color]="item.status === 'COMPLETED' ? 'success' : 'warning'"
                  >
                    {{
                      (item.status === 'COMPLETED' ? 'progress.done' : 'progress.ongoing')
                        | translate
                    }}
                  </ion-badge>
                </ion-item>
              }
            </ion-list>
          }
        </div>
      }
    </ion-content>
  `
})
export class ProgressPage implements OnInit {
  private readonly api = inject(ApiService);

  readonly summary = signal<ProgressSummary | null>(null);
  readonly loading = signal(true);

  ngOnInit(): void {
    this.api.getProgressSummary().subscribe({
      next: (summary) => {
        this.summary.set(summary);
        this.loading.set(false);
      },
      error: () => this.loading.set(false)
    });
  }
}
