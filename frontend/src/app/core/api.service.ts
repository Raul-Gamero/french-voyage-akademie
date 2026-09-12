import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';

import { environment } from '../../environments/environment';
import { LanguageService } from './language.service';
import {
  AnswerResult,
  LegalDocument,
  LessonDetail,
  LessonProgress,
  LevelSummary,
  ProgressSummary,
  UnitSummary,
  UserProfile
} from './models';

/**
 * Accès unique à l'API.
 *
 * <p>La langue courante est ajoutée automatiquement à chaque appel de
 * contenu : aucune page n'a à y penser, et changer de langue suffit à
 * changer tout le contenu affiché.</p>
 */
@Injectable({ providedIn: 'root' })
export class ApiService {
  private readonly http = inject(HttpClient);
  private readonly language = inject(LanguageService);

  private get base(): string {
    return environment.apiUrl;
  }

  private localeParams(): HttpParams {
    return new HttpParams().set('locale', this.language.current());
  }

  // --- Catalogue (public) --------------------------------------------

  listLevels(): Observable<LevelSummary[]> {
    return this.http.get<LevelSummary[]>(`${this.base}/catalog/levels`, {
      params: this.localeParams()
    });
  }

  listUnits(levelCode: string): Observable<UnitSummary[]> {
    return this.http.get<UnitSummary[]>(`${this.base}/catalog/levels/${levelCode}/units`, {
      params: this.localeParams()
    });
  }

  getLesson(slug: string): Observable<LessonDetail> {
    return this.http.get<LessonDetail>(`${this.base}/catalog/lessons/${slug}`, {
      params: this.localeParams()
    });
  }

  getLegalDocument(document: 'privacy' | 'terms'): Observable<LegalDocument> {
    return this.http.get<LegalDocument>(`${this.base}/legal/${document}`, {
      params: this.localeParams()
    });
  }

  // --- Progression (authentifié) --------------------------------------

  getProgressSummary(): Observable<ProgressSummary> {
    return this.http.get<ProgressSummary>(`${this.base}/progress`, {
      params: this.localeParams()
    });
  }

  startLesson(slug: string): Observable<LessonProgress> {
    return this.http.post<LessonProgress>(
      `${this.base}/progress/lessons/${slug}/start`,
      {},
      { params: this.localeParams() }
    );
  }

  submitAnswer(slug: string, exerciseId: number, answer: string): Observable<AnswerResult> {
    return this.http.post<AnswerResult>(
      `${this.base}/progress/lessons/${slug}/answers`,
      { exerciseId, answer },
      { params: this.localeParams() }
    );
  }

  completeLesson(slug: string): Observable<LessonProgress> {
    return this.http.post<LessonProgress>(
      `${this.base}/progress/lessons/${slug}/complete`,
      {},
      { params: this.localeParams() }
    );
  }

  // --- Profil ----------------------------------------------------------

  getProfile(): Observable<UserProfile> {
    return this.http.get<UserProfile>(`${this.base}/me`);
  }

  updateProfile(displayName: string, interfaceLocale: string): Observable<UserProfile> {
    return this.http.put<UserProfile>(`${this.base}/me`, { displayName, interfaceLocale });
  }

  changePassword(currentPassword: string, newPassword: string): Observable<void> {
    return this.http.post<void>(`${this.base}/me/password`, { currentPassword, newPassword });
  }

  deleteAccount(): Observable<void> {
    return this.http.delete<void>(`${this.base}/me`);
  }
}
