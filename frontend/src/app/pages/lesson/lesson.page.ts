import { Component, OnInit, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import {
  IonBackButton,
  IonBadge,
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonContent,
  IonHeader,
  IonInput,
  IonProgressBar,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { ApiService } from '../../core/api.service';
import { AuthService } from '../../core/auth.service';
import { AnswerResult, Exercise, LessonDetail } from '../../core/models';
import { LessonMarkdownPipe } from '../../shared/lesson-markdown.pipe';

@Component({
  selector: 'fva-lesson',
  standalone: true,
  imports: [
    FormsModule,
    RouterLink,
    TranslateModule,
    LessonMarkdownPipe,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonBackButton,
    IonContent,
    IonCard,
    IonCardHeader,
    IonCardTitle,
    IonCardContent,
    IonButton,
    IonInput,
    IonBadge,
    IonProgressBar,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-back-button [defaultHref]="'/learn/' + (lesson()?.levelCode ?? 'A1')" />
        </ion-buttons>
        <ion-title>{{ lesson()?.title ?? ('common.loading' | translate) }}</ion-title>
      </ion-toolbar>
      @if (lesson()) {
        <ion-progress-bar
          [value]="scoreRatio()"
          [attr.aria-label]="'lesson.scoreLabel' | translate"
        />
      }
    </ion-header>

    <ion-content class="ion-padding">
      @if (loading()) {
        <div class="flex justify-center py-10">
          <ion-spinner [attr.aria-label]="'common.loading' | translate" />
        </div>
      } @else if (!lesson()) {
        <p role="alert" class="rounded-lg bg-red-50 p-4 text-sm text-red-800">
          {{ 'common.loadError' | translate }}
        </p>
      } @else {
        <article class="mx-auto max-w-reading pb-10">
          <header class="mb-6">
            <p class="text-xs uppercase tracking-wide opacity-60">
              {{ lesson()!.levelCode }} · {{ lesson()!.unitTitle }}
            </p>
            <h1 class="mt-1 text-2xl font-bold">{{ lesson()!.title }}</h1>
            @if (lesson()!.objective) {
              <p class="mt-3 rounded-lg bg-voyage-50 p-3 text-sm">
                <strong>{{ 'lesson.objective' | translate }} : </strong>{{ lesson()!.objective }}
              </p>
            }
          </header>

          <!-- Sections de contenu -->
          @for (section of lesson()!.sections; track section.id) {
            <section class="mb-8" [attr.aria-labelledby]="'section-' + section.id">
              <h2 [id]="'section-' + section.id" class="mb-2 text-lg font-semibold">
                {{ section.title }}
              </h2>
              <div class="lesson-prose" [innerHTML]="section.body | lessonMarkdown"></div>

              @if (section.mediaUrl) {
                <p class="mt-2 text-sm">
                  <a [href]="section.mediaUrl" target="_blank" rel="noopener noreferrer">
                    {{ 'lesson.watchVideo' | translate }} ↗
                  </a>
                </p>
              }
            </section>
          }

          <!-- Vocabulaire -->
          @if (lesson()!.vocabulary.length) {
            <section class="mb-8" aria-labelledby="vocabulary-heading">
              <h2 id="vocabulary-heading" class="mb-3 text-lg font-semibold">
                {{ 'lesson.vocabulary' | translate }}
              </h2>
              <dl class="divide-y rounded-xl border">
                @for (entry of lesson()!.vocabulary; track entry.id) {
                  <div class="p-3">
                    <dt class="font-semibold">
                      {{ entry.term }}
                      @if (entry.phonetic) {
                        <span class="ml-2 text-sm font-normal opacity-60">[{{ entry.phonetic }}]</span>
                      }
                    </dt>
                    <dd class="text-sm">{{ entry.translation }}</dd>
                    @if (entry.exampleSentence) {
                      <dd class="mt-1 text-sm italic opacity-70">{{ entry.exampleSentence }}</dd>
                    }
                  </div>
                }
              </dl>
            </section>
          }

          <!-- Exercices -->
          @if (lesson()!.exercises.length) {
            <section aria-labelledby="exercises-heading">
              <h2 id="exercises-heading" class="mb-1 text-lg font-semibold">
                {{ 'lesson.exercises' | translate }}
              </h2>

              @if (!auth.isAuthenticated()) {
                <p class="mb-4 rounded-lg bg-amber-50 p-3 text-sm text-amber-900">
                  {{ 'lesson.loginToTrack' | translate }}
                  <a routerLink="/login" class="font-semibold">{{ 'nav.login' | translate }}</a>
                </p>
              } @else {
                <p class="mb-4 text-sm opacity-70">
                  {{ 'lesson.score' | translate: { score: score(), max: lesson()!.maxScore } }}
                </p>
              }

              @for (exercise of lesson()!.exercises; track exercise.id) {
                <ion-card>
                  <ion-card-header>
                    <ion-card-title class="text-base">
                      {{ exercise.position }}. {{ exercise.prompt }}
                    </ion-card-title>
                  </ion-card-header>

                  <ion-card-content>
                    @if (exercise.type === 'FILL_BLANK') {
                      <ion-input
                        [label]="'lesson.yourAnswer' | translate"
                        labelPlacement="stacked"
                        fill="outline"
                        [disabled]="!auth.isAuthenticated()"
                        [(ngModel)]="textAnswers[exercise.id]"
                        [name]="'answer-' + exercise.id"
                        (keyup.enter)="submitText(exercise)"
                      />
                      <ion-button
                        class="mt-3"
                        size="small"
                        [disabled]="!auth.isAuthenticated() || submitting()"
                        (click)="submitText(exercise)"
                      >
                        {{ 'lesson.check' | translate }}
                      </ion-button>
                    } @else {
                      <div class="flex flex-col gap-2" role="group" [attr.aria-label]="exercise.prompt">
                        @for (option of exercise.options; track option.id) {
                          <ion-button
                            expand="block"
                            fill="outline"
                            class="text-left"
                            [disabled]="!auth.isAuthenticated() || submitting()"
                            (click)="submitOption(exercise, option.id)"
                          >
                            {{ option.label }}
                          </ion-button>
                        }
                      </div>
                    }

                    @if (results[exercise.id]; as result) {
                      <div
                        role="status"
                        class="mt-3 rounded-lg p-3 text-sm"
                        [class.bg-green-50]="result.correct"
                        [class.text-green-900]="result.correct"
                        [class.bg-red-50]="!result.correct"
                        [class.text-red-900]="!result.correct"
                      >
                        <p class="font-semibold">
                          {{
                            (result.correct ? 'lesson.correct' : 'lesson.incorrect') | translate
                          }}
                          @if (result.pointsAwarded > 0) {
                            <ion-badge color="success" class="ml-2">
                              +{{ result.pointsAwarded }}
                            </ion-badge>
                          }
                        </p>
                        @if (result.explanation) {
                          <p class="mt-1">{{ result.explanation }}</p>
                        }
                      </div>
                    }
                  </ion-card-content>
                </ion-card>
              }

              @if (auth.isAuthenticated()) {
                <ion-button
                  expand="block"
                  class="mt-6"
                  [disabled]="completed()"
                  (click)="complete()"
                >
                  {{ (completed() ? 'lesson.completed' : 'lesson.markComplete') | translate }}
                </ion-button>
              }
            </section>
          }
        </article>
      }
    </ion-content>
  `
})
export class LessonPage implements OnInit {
  private readonly api = inject(ApiService);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  readonly auth = inject(AuthService);

  readonly lesson = signal<LessonDetail | null>(null);
  readonly loading = signal(true);
  readonly score = signal(0);
  readonly completed = signal(false);
  readonly submitting = signal(false);

  /** Saisies libres et verdicts, indexés par identifiant d'exercice. */
  readonly textAnswers: Record<number, string> = {};
  readonly results: Record<number, AnswerResult> = {};

  private slug = '';

  ngOnInit(): void {
    this.slug = this.route.snapshot.paramMap.get('slug') ?? '';

    this.api.getLesson(this.slug).subscribe({
      next: (lesson) => {
        this.lesson.set(lesson);
        this.loading.set(false);

        // Ouvrir la leçon n'a de sens que pour une personne connectée ;
        // sinon la consultation reste entièrement libre, sans suivi.
        if (this.auth.isAuthenticated()) {
          this.api.startLesson(this.slug).subscribe({
            next: (progress) => {
              this.score.set(progress.score);
              this.completed.set(progress.status === 'COMPLETED');
            },
            error: () => {
              /* le suivi échoue : la leçon reste lisible */
            }
          });
        }
      },
      error: () => this.loading.set(false)
    });
  }

  scoreRatio(): number {
    const max = this.lesson()?.maxScore ?? 0;
    return max === 0 ? 0 : this.score() / max;
  }

  submitOption(exercise: Exercise, optionId: number): void {
    this.send(exercise, String(optionId));
  }

  submitText(exercise: Exercise): void {
    const answer = (this.textAnswers[exercise.id] ?? '').trim();
    if (answer.length > 0) {
      this.send(exercise, answer);
    }
  }

  complete(): void {
    this.api.completeLesson(this.slug).subscribe({
      next: () => this.completed.set(true)
    });
  }

  private send(exercise: Exercise, answer: string): void {
    if (!this.auth.isAuthenticated()) {
      void this.router.navigate(['/login'], { queryParams: { redirect: `/lesson/${this.slug}` } });
      return;
    }

    this.submitting.set(true);
    this.api.submitAnswer(this.slug, exercise.id, answer).subscribe({
      next: (result) => {
        this.results[exercise.id] = result;
        this.score.set(result.lessonScore);
        this.submitting.set(false);
      },
      error: () => this.submitting.set(false)
    });
  }
}
