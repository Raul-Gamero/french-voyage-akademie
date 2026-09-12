import { DOCUMENT } from '@angular/common';
import { Injectable, inject, signal } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

import { Locale } from './models';

const LANGUAGE_KEY = 'fva.locale';

/**
 * Langue de l'interface.
 *
 * <p>L'anglais est la langue véhiculaire par défaut : le public visé vient
 * de Amérique latine, d'Afrique, d'Asie et du monde arabe, et ne partage
 * pas une langue maternelle commune. Le français est proposé pour les
 * personnes déjà installées en pays francophone.</p>
 *
 * <p>L'ajout de l'espagnol ou de l'allemand ne demande qu'un fichier de
 * traduction supplémentaire et une entrée dans {@link SUPPORTED}.</p>
 */
@Injectable({ providedIn: 'root' })
export class LanguageService {
  static readonly SUPPORTED: ReadonlyArray<{ code: Locale; label: string }> = [
    { code: 'en', label: 'English' },
    { code: 'fr', label: 'Français' }
  ];

  static readonly DEFAULT: Locale = 'en';

  private readonly translate = inject(TranslateService);
  private readonly document = inject(DOCUMENT);
  private readonly locale = signal<Locale>(LanguageService.DEFAULT);

  readonly current = this.locale.asReadonly();

  /** Appelé une fois au démarrage, avant le premier rendu. */
  initialise(): void {
    this.translate.addLangs(LanguageService.SUPPORTED.map((entry) => entry.code));
    this.translate.setDefaultLang(LanguageService.DEFAULT);
    this.use(this.detect());
  }

  use(locale: Locale): void {
    const resolved = this.normalise(locale);
    this.locale.set(resolved);
    this.translate.use(resolved);

    // L'attribut lang conditionne la prononciation des lecteurs d'écran
    // et la coupure des mots : critère 3.1.1 des WCAG.
    this.document.documentElement.lang = resolved;

    try {
      localStorage.setItem(LANGUAGE_KEY, resolved);
    } catch {
      /* préférence non mémorisée, sans conséquence */
    }
  }

  /** Choix explicite de la personne, sinon langue du navigateur, sinon anglais. */
  private detect(): Locale {
    let stored: string | null = null;
    try {
      stored = localStorage.getItem(LANGUAGE_KEY);
    } catch {
      stored = null;
    }

    return this.normalise(stored ?? this.translate.getBrowserLang() ?? LanguageService.DEFAULT);
  }

  private normalise(candidate: string | null | undefined): Locale {
    const code = (candidate ?? '').slice(0, 2).toLowerCase();
    return LanguageService.SUPPORTED.some((entry) => entry.code === code)
      ? (code as Locale)
      : LanguageService.DEFAULT;
  }
}
