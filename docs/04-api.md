# 4. API REST

Base : `/api/v1`. Documentation interactive générée par OpenAPI : `/swagger-ui.html` ;
spécification brute : `/v3/api-docs`.

## 4.1 Conventions

- **Langue** : paramètre `locale` (`en` ou `fr`), sinon en-tête `Accept-Language`, sinon `en`.
- **Authentification** : `Authorization: Bearer <jeton>` obtenu à l'inscription ou à la connexion.
- **Erreurs** : corps uniforme, sans trace technique.

```json
{
  "timestamp": "2026-09-12T15:34:45Z",
  "status": 400,
  "error": "VALIDATION_FAILED",
  "message": "Certains champs sont invalides.",
  "path": "/api/v1/auth/register",
  "details": { "privacyConsent": "Le consentement à la politique de confidentialité est obligatoire." }
}
```

| Code `error` | HTTP | Cause |
|---|---|---|
| `VALIDATION_FAILED` | 400 | champ invalide ; `details` précise lequel |
| `BAD_REQUEST` | 400 | incohérence, par exemple exercice d'une autre leçon |
| `UNAUTHENTICATED` | 401 | jeton absent, expiré ou falsifié |
| `INVALID_CREDENTIALS` | 401 | identifiants refusés — message identique que le compte existe ou non |
| `FORBIDDEN` | 403 | rôle insuffisant |
| `NOT_FOUND` | 404 | ressource inexistante ou non publiée |
| `CONFLICT` | 409 | adresse déjà enregistrée, mot de passe actuel incorrect |
| `INTERNAL_ERROR` | 500 | erreur inattendue, détaillée uniquement dans les journaux serveur |

## 4.2 Points d'accès

### Authentification — public

| Méthode | Chemin | Corps | Réponse |
|---|---|---|---|
| POST | `/auth/register` | `email`, `password`, `displayName`, `interfaceLocale`, `privacyConsent` | 201 `AuthResponse` |
| POST | `/auth/login` | `email`, `password` | 200 `AuthResponse` |

Règles du mot de passe : 8 à 72 caractères (limite de BCrypt), au moins une lettre et un chiffre.

### Catalogue — public, mis en cache 30 minutes

| Méthode | Chemin | Réponse |
|---|---|---|
| GET | `/catalog/levels` | niveaux, état de publication, nombre d'unités et de leçons |
| GET | `/catalog/levels/{code}/units` | unités publiées et leurs leçons |
| GET | `/catalog/lessons/{slug}` | leçon complète : sections, vocabulaire, exercices **sans correction** |

### Progression — authentifié

| Méthode | Chemin | Corps | Réponse |
|---|---|---|---|
| GET | `/progress` | — | tableau de bord global |
| GET | `/progress/lessons/{slug}` | — | progression sur une leçon |
| POST | `/progress/lessons/{slug}/start` | — | idempotent |
| POST | `/progress/lessons/{slug}/answers` | `exerciseId`, `answer` | verdict, points, explication, score |
| POST | `/progress/lessons/{slug}/complete` | — | leçon terminée |

Pour un QCM ou un vrai/faux, `answer` est l'identifiant de l'option choisie. Pour un texte à trous,
c'est la saisie de l'apprenant.

### Profil — authentifié

| Méthode | Chemin | Corps | Droit RGPD |
|---|---|---|---|
| GET | `/me` | — | accès (art. 15) |
| PUT | `/me` | `displayName`, `interfaceLocale` | rectification (art. 16) |
| POST | `/me/password` | `currentPassword`, `newPassword` | — |
| DELETE | `/me` | — | effacement (art. 17) |

### Textes légaux — public

| Méthode | Chemin | Réponse |
|---|---|---|
| GET | `/legal/privacy` | politique de confidentialité et sa version |
| GET | `/legal/terms` | mentions légales |

### Supervision

| Méthode | Chemin | Réponse |
|---|---|---|
| GET | `/actuator/health` | `{"status":"UP"}` — sans détail des composants |

## 4.3 Scénario vérifié de bout en bout

Exécuté le 12/09/2026 contre le backend empaqueté et une base PostgreSQL 16 vierge, migrée par Flyway :

| # | Action | Résultat obtenu |
|---|---|---|
| 1 | Niveaux en français | A1 publié, 3 unités, 30 leçons ; A2 à C2 non publiés |
| 2 | Unités A1 en anglais | 3 unités de 10 leçons |
| 3 | Inscription | 201, rôle `ROLE_STUDENT`, jeton délivré |
| 4 | Inscription en double | 409 |
| 5 | Inscription sans consentement | 400, détail sur `privacyConsent` |
| 6 | Progression sans jeton | 401 |
| 7 | Détail de leçon | 3 sections, 8 mots, 5 exercices, score max 6, aucun champ `correct` exposé |
| 8 | Commencer la leçon | `IN_PROGRESS`, 0/6 |
| 9 | Mauvaise réponse | incorrect, 0 point |
| 10 | Bonne réponse | correct, +1, score 1/6 |
| 11 | Même bonne réponse rejouée | correct, +0, score 1/6 |
| 12 | Texte à trous « JE M'APPELLE MARIE. » | correct, +2, score 3/6 |
| 13 | Terminer | `COMPLETED`, 50 % |
| 14 | Tableau de bord | 1 terminée, 30 disponibles, 3 points |
| 15 | Profil | données du compte |
| 16 | Politique de confidentialité | version 2026-09-01, texte français |
| 17 | Suppression du compte | 204 |
| 18 | Réutilisation du jeton | 401 |
