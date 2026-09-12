/**
 * Contrats de données de l'API.
 * Reflètent exactement les enregistrements Java du backend.
 */

export type Locale = 'en' | 'fr';

export interface UserProfile {
  id: number;
  email: string;
  displayName: string;
  interfaceLocale: Locale;
  role: 'ROLE_STUDENT' | 'ROLE_ADMIN';
  createdAt: string;
  lastLoginAt?: string;
}

export interface AuthResponse {
  accessToken: string;
  tokenType: string;
  expiresIn: number;
  user: UserProfile;
}

export interface LevelSummary {
  code: string;
  name: string;
  description?: string;
  published: boolean;
  unitCount: number;
  lessonCount: number;
}

export interface LessonSummary {
  id: number;
  slug: string;
  position: number;
  title: string;
  summary?: string;
  estimatedMinutes: number;
  exerciseCount: number;
}

export interface UnitSummary {
  id: number;
  slug: string;
  position: number;
  title: string;
  description?: string;
  lessons: LessonSummary[];
}

export type SectionType =
  | 'INTRODUCTION'
  | 'GRAMMAR'
  | 'VOCABULARY'
  | 'PRONUNCIATION'
  | 'CULTURE'
  | 'READING'
  | 'MEDIA'
  | 'SUMMARY';

export interface LessonSection {
  id: number;
  position: number;
  type: SectionType;
  title: string;
  body?: string;
  mediaUrl?: string;
  mediaType?: 'VIDEO' | 'AUDIO' | 'IMAGE' | 'LINK';
}

export interface VocabularyEntry {
  id: number;
  position: number;
  term: string;
  phonetic?: string;
  translation: string;
  note?: string;
  exampleSentence?: string;
  audioUrl?: string;
}

export type ExerciseType = 'MULTIPLE_CHOICE' | 'TRUE_FALSE' | 'FILL_BLANK';

export interface ExerciseOption {
  id: number;
  position: number;
  label: string;
}

export interface Exercise {
  id: number;
  position: number;
  type: ExerciseType;
  prompt: string;
  points: number;
  options: ExerciseOption[];
}

export interface LessonDetail {
  id: number;
  slug: string;
  position: number;
  title: string;
  summary?: string;
  objective?: string;
  estimatedMinutes: number;
  unitSlug: string;
  unitTitle: string;
  levelCode: string;
  maxScore: number;
  sections: LessonSection[];
  vocabulary: VocabularyEntry[];
  exercises: Exercise[];
}

export interface AnswerResult {
  exerciseId: number;
  correct: boolean;
  pointsAwarded: number;
  explanation?: string;
  lessonScore: number;
  lessonMaxScore: number;
}

export interface LessonProgress {
  lessonId: number;
  lessonSlug: string;
  lessonTitle: string;
  unitSlug: string;
  status: 'IN_PROGRESS' | 'COMPLETED';
  score: number;
  maxScore: number;
  percentage: number;
  startedAt: string;
  completedAt?: string;
}

export interface ProgressSummary {
  lessonsCompleted: number;
  lessonsInProgress: number;
  lessonsAvailable: number;
  totalScore: number;
  completionPercentage: number;
  lessons: LessonProgress[];
}

export interface LegalDocument {
  document: string;
  locale: Locale;
  version: string;
  body: string;
}

/** Corps d'erreur uniforme renvoyé par le backend. */
export interface ApiError {
  timestamp: string;
  status: number;
  error: string;
  message: string;
  path: string;
  details?: Record<string, string>;
}
