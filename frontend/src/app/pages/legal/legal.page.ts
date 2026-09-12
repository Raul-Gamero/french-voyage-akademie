import { Component, OnInit, inject, signal } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonSpinner,
  IonTitle,
  IonToolbar
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { ApiService } from '../../core/api.service';
import { LegalDocument } from '../../core/models';
import { LessonMarkdownPipe } from '../../shared/lesson-markdown.pipe';

/**
 * Affiche la politique de confidentialité et les mentions légales.
 *
 * <p>Le texte vient de l'API plutôt que du client : une mise à jour
 * s'applique immédiatement, y compris aux applications déjà installées.</p>
 */
@Component({
  selector: 'fva-legal',
  standalone: true,
  imports: [
    TranslateModule,
    LessonMarkdownPipe,
    IonHeader,
    IonToolbar,
    IonTitle,
    IonButtons,
    IonBackButton,
    IonContent,
    IonSpinner
  ],
  template: `
    <ion-header>
      <ion-toolbar>
        <ion-buttons slot="start"><ion-back-button defaultHref="/" /></ion-buttons>
        <ion-title>
          {{ (documentKey === 'privacy' ? 'nav.privacy' : 'nav.terms') | translate }}
        </ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      @if (loading()) {
        <div class="flex justify-center py-10">
          <ion-spinner [attr.aria-label]="'common.loading' | translate" />
        </div>
      } @else if (!document()) {
        <p role="alert" class="rounded-lg bg-red-50 p-4 text-sm text-red-800">
          {{ 'common.loadError' | translate }}
        </p>
      } @else {
        <article class="lesson-prose mx-auto" [innerHTML]="document()!.body | lessonMarkdown"></article>
      }
    </ion-content>
  `
})
export class LegalPage implements OnInit {
  private readonly api = inject(ApiService);
  private readonly route = inject(ActivatedRoute);

  documentKey: 'privacy' | 'terms' = 'privacy';
  readonly document = signal<LegalDocument | null>(null);
  readonly loading = signal(true);

  ngOnInit(): void {
    this.documentKey = this.route.snapshot.paramMap.get('document') === 'terms' ? 'terms' : 'privacy';

    this.api.getLegalDocument(this.documentKey).subscribe({
      next: (document) => {
        this.document.set(document);
        this.loading.set(false);
      },
      error: () => this.loading.set(false)
    });
  }
}
