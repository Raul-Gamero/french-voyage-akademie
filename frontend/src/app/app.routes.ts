import { Routes } from '@angular/router';

import { authGuard } from './core/auth.guard';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () => import('./pages/home/home.page').then((m) => m.HomePage)
  },
  {
    path: 'learn/:levelCode',
    loadComponent: () => import('./pages/units/units.page').then((m) => m.UnitsPage)
  },
  {
    path: 'lesson/:slug',
    loadComponent: () => import('./pages/lesson/lesson.page').then((m) => m.LessonPage)
  },
  {
    path: 'login',
    loadComponent: () => import('./pages/login/login.page').then((m) => m.LoginPage)
  },
  {
    path: 'register',
    loadComponent: () => import('./pages/register/register.page').then((m) => m.RegisterPage)
  },
  {
    path: 'progress',
    canActivate: [authGuard],
    loadComponent: () => import('./pages/progress/progress.page').then((m) => m.ProgressPage)
  },
  {
    path: 'profile',
    canActivate: [authGuard],
    loadComponent: () => import('./pages/profile/profile.page').then((m) => m.ProfilePage)
  },
  {
    path: 'legal/:document',
    loadComponent: () => import('./pages/legal/legal.page').then((m) => m.LegalPage)
  },
  {
    path: '**',
    redirectTo: ''
  }
];
