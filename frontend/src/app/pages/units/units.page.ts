import { Component, OnInit, inject, signal } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import {
  IonAccordion,
  IonAccordionGroup,
  IonBackButton,
  IonBadge,
  IonButtons,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonList,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';
import { forkJoin, of } from 'rxjs';
import { catchError } from 'rxjs/operators';

import { ApiService } from '../../core/api.service';
import { AuthService } from '../../core/auth.service';
import { LessonProgress, UnitSummary } from '../../core/models';

@Component({
  selector: 'fva-units',
  standalone: true,
  imports: [
    RouterLink,
    TranslateModule,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonBackButton,
    IonContent,
    IonAccordionGroup,
    IonAccordion,
    IonItem,
    IonLabel,
    IonList,
    IonBadge,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-back-button defaultHref="/" /></ion-buttons>
        <ion-title>{{ 'units.title' | translate: { level: levelCode } }}</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      @if (loading()) {
        <div class="flex justify-center py-10">
          <ion-spinner [attr.aria-label]="'common.loading' | translate" />
        </div>
      } @else if (error()) {
        <p role="alert" class="rounded-lg bg-red-50 p-4 text-sm text-red-800">
          {{ 'common.loadError' | translate }}
        </p>
      } @else {
        <div class="mx-auto max-w-reading">
          <ion-accordion-group [value]="['unit-0']" [multiple]="true">
            @for (unit of units(); track unit.slug; let unitIndex = $index) {
              <ion-accordion [value]="'unit-' + unitIndex">
                <ion-item slot="header">
                  <ion-label>
                    <h2 class="font-semibold">{{ unit.title }}</h2>
                    <p class="text-sm opacity-70">{{ unit.description }}</p>
                  </ion-label>
                </ion-item>

                <ion-list slot="content">
                  @for (lesson of unit.lessons; track lesson.slug) {
                    <ion-item
                      [routerLink]="['/lesson', lesson.slug]"
                      button
                      [detail]="true"
                      lines="full"
                    >
                      <ion-label>
                        <h3>{{ lesson.position }}. {{ lesson.title }}</h3>
                        <p class="text-sm opacity-70">{{ lesson.summary }}</p>
                        <p class="text-xs opacity-60">
                          {{ 'units.duration' | translate: { minutes: lesson.estimatedMinutes } }}
                          ·
                          {{ 'units.exercises' | translate: { count: lesson.exerciseCount } }}
                        </p>
                      </ion-label>

                      @if (progressFor(lesson.slug); as progress) {
                        <ion-badge
                          slot="end"
                          [color]="progress.status === 'COMPLETED' ? 'success' : 'warning'"
                        >
                          {{ progress.percentage }} %
                        </ion-badge>
                      }
                    </ion-item>
                  }
                </ion-list>
              </ion-accordion>
            }
          </ion-accordion-group>
        </div>
      }
    </ion-content>
  `
})
export class UnitsPage implements OnInit {
  private readonly api = inject(ApiService);
  private readonly route = inject(ActivatedRoute);
  private readonly auth = inject(AuthService);

  levelCode = 'A1';
  readonly units = signal<UnitSummary[]>([]);
  readonly loading = signal(true);
  readonly error = signal(false);

  private readonly progressBySlug = signal<Map<string, LessonProgress>>(new Map());

  ngOnInit(): void {
    this.levelCode = (this.route.snapshot.paramMap.get('levelCode') ?? 'A1').toUpperCase();

    // La progression n'est demandée que si la personne est connectée, et
    // son échec ne doit jamais empêcher l'affichage du catalogue.
    forkJoin({
      units: this.api.listUnits(this.levelCode),
      progress: this.auth.isAuthenticated()
        ? this.api.getProgressSummary().pipe(catchError(() => of(null)))
        : of(null)
    }).subscribe({
      next: ({ units, progress }) => {
        this.units.set(units);
        if (progress) {
          this.progressBySlug.set(new Map(progress.lessons.map((item) => [item.lessonSlug, item])));
        }
        this.loading.set(false);
      },
      error: () => {
        this.error.set(true);
        this.loading.set(false);
      }
    });
  }

  progressFor(slug: string): LessonProgress | undefined {
    return this.progressBySlug().get(slug);
  }
}
