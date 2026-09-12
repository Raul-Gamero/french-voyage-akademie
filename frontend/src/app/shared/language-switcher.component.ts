import { Component, inject } from '@angular/core';
import { IonSegment, IonSegmentButton, IonLabel } from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';

import { LanguageService } from '../core/language.service';
import { Locale } from '../core/models';

/** Bascule entre les langues d'interface disponibles. */
@Component({
  selector: 'fva-language-switcher',
  standalone: true,
  imports: [IonSegment, IonSegmentButton, IonLabel, TranslateModule],
  template: `
    <label class="sr-only" for="language-switcher">{{ 'a11y.chooseLanguage' | translate }}</label>
    <ion-segment
      id="language-switcher"
      [value]="language.current()"
      (ionChange)="onChange($event)"
    >
      @for (option of options; track option.code) {
        <ion-segment-button [value]="option.code">
          <ion-label>{{ option.label }}</ion-label>
        </ion-segment-button>
      }
    </ion-segment>
  `
})
export class LanguageSwitcherComponent {
  readonly language = inject(LanguageService);
  readonly options = LanguageService.SUPPORTED;

  onChange(event: Event): void {
    const value = (event as CustomEvent<{ value: string }>).detail.value;
    this.language.use(value as Locale);
  }
}
