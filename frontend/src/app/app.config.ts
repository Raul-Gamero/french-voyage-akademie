import { HttpClient, provideHttpClient, withInterceptors } from '@angular/common/http';
import { APP_INITIALIZER, ApplicationConfig, importProvidersFrom, isDevMode } from '@angular/core';
import { provideAnimations } from '@angular/platform-browser/animations';
import { PreloadAllModules, provideRouter, withPreloading } from '@angular/router';
import { provideServiceWorker } from '@angular/service-worker';
import { provideIonicAngular } from '@ionic/angular/standalone';
import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';

import { routes } from './app.routes';
import { authInterceptor } from './core/auth.interceptor';
import { LanguageService } from './core/language.service';

export function translateLoaderFactory(http: HttpClient): TranslateLoader {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

export const appConfig: ApplicationConfig = {
  providers: [
    provideIonicAngular({ mode: 'md' }),
    provideAnimations(),

    // Toutes les routes sont préchargées : l'application entière tient en
    // quelques centaines de kilo-octets, et une fois chargée elle reste
    // utilisable même si la connexion se coupe.
    provideRouter(routes, withPreloading(PreloadAllModules)),

    provideHttpClient(withInterceptors([authInterceptor])),

    importProvidersFrom(
      TranslateModule.forRoot({
        defaultLanguage: LanguageService.DEFAULT,
        loader: {
          provide: TranslateLoader,
          useFactory: translateLoaderFactory,
          deps: [HttpClient]
        }
      })
    ),

    {
      provide: APP_INITIALIZER,
      multi: true,
      deps: [LanguageService],
      useFactory: (language: LanguageService) => () => language.initialise()
    },

    provideServiceWorker('ngsw-worker.js', {
      enabled: !isDevMode(),
      // Laisse l'application démarrer sans attendre le service worker,
      // ce qui évite un écran blanc sur connexion lente.
      registrationStrategy: 'registerWhenStable:30000'
    })
  ]
};
