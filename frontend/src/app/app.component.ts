import { Component, inject } from '@angular/core';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import {
  IonApp,
  IonContent,
  IonIcon,
  IonItem,
  IonLabel,
  IonList,
  IonListHeader,
  IonMenu,
  IonMenuToggle,
  IonNote,
  IonRouterOutlet,
  IonSplitPane
} from '@ionic/angular/standalone';
import { TranslateModule } from '@ngx-translate/core';
import { addIcons } from 'ionicons';
import {
  bookOutline,
  homeOutline,
  logInOutline,
  logOutOutline,
  personOutline,
  shieldCheckmarkOutline,
  statsChartOutline
} from 'ionicons/icons';

import { AuthService } from './core/auth.service';
import { LanguageSwitcherComponent } from './shared/language-switcher.component';

@Component({
  selector: 'fva-root',
  standalone: true,
  imports: [
    RouterOutlet,
    RouterLink,
    RouterLinkActive,
    TranslateModule,
    LanguageSwitcherComponent,
    IonApp,
    IonSplitPane,
    IonMenu,
    IonContent,
    IonList,
    IonListHeader,
    IonMenuToggle,
    IonItem,
    IonIcon,
    IonLabel,
    IonNote,
    IonRouterOutlet
  ],
  template: `
    <ion-app>
      <a class="skip-link" href="#main-content">{{ 'a11y.skipToContent' | translate }}</a>

      <ion-split-pane contentId="main-content" when="lg">
        <ion-menu contentId="main-content" type="overlay">
          <ion-content>
            <ion-list>
              <ion-list-header>French Voyage Akademie</ion-list-header>
              <ion-note class="ion-padding-start block pb-3 text-sm">
                {{ 'app.tagline' | translate }}
              </ion-note>

              @for (item of navigation; track item.url) {
                @if (!item.requiresAuth || auth.isAuthenticated()) {
                  <ion-menu-toggle [autoHide]="false">
                    <ion-item
                      [routerLink]="item.url"
                      routerLinkActive="selected"
                      [routerLinkActiveOptions]="{ exact: item.url === '/' }"
                      lines="none"
                      detail="false"
                    >
                      <ion-icon slot="start" [name]="item.icon" aria-hidden="true"></ion-icon>
                      <ion-label>{{ item.labelKey | translate }}</ion-label>
                    </ion-item>
                  </ion-menu-toggle>
                }
              }

              @if (!auth.isAuthenticated()) {
                <ion-menu-toggle [autoHide]="false">
                  <ion-item routerLink="/login" lines="none" detail="false">
                    <ion-icon slot="start" name="log-in-outline" aria-hidden="true"></ion-icon>
                    <ion-label>{{ 'nav.login' | translate }}</ion-label>
                  </ion-item>
                </ion-menu-toggle>
              } @else {
                <ion-menu-toggle [autoHide]="false">
                  <ion-item button (click)="auth.logout()" lines="none" detail="false">
                    <ion-icon slot="start" name="log-out-outline" aria-hidden="true"></ion-icon>
                    <ion-label>{{ 'nav.logout' | translate }}</ion-label>
                  </ion-item>
                </ion-menu-toggle>
              }

              <ion-menu-toggle [autoHide]="false">
                <ion-item routerLink="/legal/privacy" lines="none" detail="false">
                  <ion-icon slot="start" name="shield-checkmark-outline" aria-hidden="true"></ion-icon>
                  <ion-label>{{ 'nav.privacy' | translate }}</ion-label>
                </ion-item>
              </ion-menu-toggle>
            </ion-list>

            <div class="px-4 pt-2">
              <fva-language-switcher />
            </div>
          </ion-content>
        </ion-menu>

        <ion-router-outlet id="main-content"></ion-router-outlet>
      </ion-split-pane>
    </ion-app>
  `,
  styles: [
    `
      ion-item.selected {
        --color: var(--ion-color-primary);
        font-weight: 600;
      }
    `
  ]
})
export class AppComponent {
  readonly auth = inject(AuthService);

  readonly navigation = [
    { url: '/', icon: 'home-outline', labelKey: 'nav.home', requiresAuth: false },
    { url: '/learn/A1', icon: 'book-outline', labelKey: 'nav.courses', requiresAuth: false },
    { url: '/progress', icon: 'stats-chart-outline', labelKey: 'nav.progress', requiresAuth: true },
    { url: '/profile', icon: 'person-outline', labelKey: 'nav.profile', requiresAuth: true }
  ];

  constructor() {
    addIcons({
      homeOutline,
      bookOutline,
      statsChartOutline,
      personOutline,
      logInOutline,
      logOutOutline,
      shieldCheckmarkOutline
    });
  }
}
