# 3. Modélisation UML

## 3.1 Cas d'utilisation

```mermaid
flowchart LR
    V(("Visiteur"))
    A(("Apprenant"))
    AD(("Administrateur"))

    subgraph Système["French Voyage Akademie"]
        UC1["Consulter les niveaux et les unités"]
        UC2["Lire une leçon"]
        UC3["Lire les textes légaux"]
        UC4["Créer un compte"]
        UC5["Se connecter"]
        UC6["Répondre à un exercice"]
        UC7["Terminer une leçon"]
        UC8["Consulter sa progression"]
        UC9["Modifier son profil et sa langue"]
        UC10["Changer de mot de passe"]
        UC11["Supprimer son compte"]
        UC12["Publier du contenu<br/>(migration Flyway)"]
    end

    V --- UC1 & UC2 & UC3 & UC4 & UC5
    A --- UC6 & UC7 & UC8 & UC9 & UC10 & UC11
    AD --- UC12
    A -.->|hérite| V
    UC4 -.->|« include »<br/>consentement RGPD| UC3
    UC6 -.->|« include »| UC2
```

L'administrateur ne dispose volontairement d'aucune interface de saisie dans cette version : le
contenu est versionné dans le dépôt et publié par migration. Cela garantit la traçabilité de chaque
modification pédagogique et évite une surface d'attaque supplémentaire.

## 3.2 Diagramme de classes — domaine

```mermaid
classDiagram
    direction LR

    class Level {
        Long id
        String code
        Integer position
        boolean published
        Map~String, LevelText~ translations
    }
    class Unit {
        Long id
        String slug
        Integer position
        boolean published
        Map~String, UnitText~ translations
    }
    class Lesson {
        Long id
        String slug
        Integer position
        Integer estimatedMinutes
        boolean published
        Map~String, LessonText~ translations
        +maxScore() int
    }
    class LessonSection {
        Long id
        Integer position
        SectionType sectionType
        String mediaUrl
        MediaType mediaType
    }
    class VocabularyItem {
        Long id
        String term
        String phonetic
        String exampleSentence
    }
    class Exercise {
        Long id
        Integer position
        ExerciseType exerciseType
        Integer points
        +isCorrect(String) boolean
    }
    class ExerciseOption {
        Long id
        String label
        boolean correct
    }
    class ExerciseAnswer {
        Long id
        String normalizedAnswer
    }
    class User {
        Long id
        String email
        String passwordHash
        String displayName
        String interfaceLocale
        Role role
        String privacyConsentVersion
        Instant privacyConsentAt
    }
    class LessonProgress {
        Long id
        ProgressStatus status
        Integer score
        Integer maxScore
        +percentage() int
    }
    class ExerciseAttempt {
        Long id
        String submittedAnswer
        boolean correct
        Integer pointsAwarded
    }
    class ExerciseType {
        <<enumeration>>
        MULTIPLE_CHOICE
        TRUE_FALSE
        FILL_BLANK
    }
    class ProgressStatus {
        <<enumeration>>
        IN_PROGRESS
        COMPLETED
    }

    Level "1" *-- "0..*" Unit
    Unit "1" *-- "0..*" Lesson
    Lesson "1" *-- "0..*" LessonSection
    Lesson "1" *-- "0..*" VocabularyItem
    Lesson "1" *-- "0..*" Exercise
    Exercise "1" *-- "0..*" ExerciseOption
    Exercise "1" *-- "0..*" ExerciseAnswer
    Exercise ..> ExerciseType
    User "1" --> "0..*" LessonProgress
    Lesson "1" <-- "0..*" LessonProgress
    User "1" --> "0..*" ExerciseAttempt
    Exercise "1" <-- "0..*" ExerciseAttempt
    LessonProgress ..> ProgressStatus
```

## 3.3 Diagramme de classes — services et contrôleurs

```mermaid
classDiagram
    direction TB

    class AuthController {
        +register(RegisterRequest) AuthResponse
        +login(LoginRequest) AuthResponse
    }
    class UserController {
        +profile() UserProfileResponse
        +update(UpdateProfileRequest) UserProfileResponse
        +changePassword(ChangePasswordRequest)
        +deleteAccount()
    }
    class CatalogController {
        +listLevels(locale) List~LevelSummaryResponse~
        +listUnits(levelCode, locale) List~UnitSummaryResponse~
        +getLesson(slug, locale) LessonDetailResponse
    }
    class ProgressController {
        +summary(locale) ProgressSummaryResponse
        +start(slug, locale) LessonProgressResponse
        +submit(slug, SubmitAnswerRequest, locale) AnswerResultResponse
        +complete(slug, locale) LessonProgressResponse
    }
    class UserService
    class CatalogService
    class ProgressService
    class JwtService {
        +issueToken(AuthenticatedUser) String
        +parse(String) Optional~Claims~
    }
    class JwtAuthenticationFilter
    class LocaleSupport {
        <<utility>>
        +normalize(String) String
        +resolve(Map, String) T
    }
    class TextNormalizer {
        <<utility>>
        +matches(String, String) boolean
    }

    AuthController --> UserService
    AuthController --> JwtService
    UserController --> UserService
    CatalogController --> CatalogService
    ProgressController --> ProgressService
    JwtAuthenticationFilter --> JwtService
    CatalogService ..> LocaleSupport
    ProgressService ..> LocaleSupport
    ProgressService ..> TextNormalizer : via Exercise.isCorrect
```

## 3.4 Séquence — inscription

```mermaid
sequenceDiagram
    actor V as Visiteur
    participant F as PWA
    participant A as AuthController
    participant U as UserService
    participant P as PasswordEncoder
    participant R as UserRepository
    participant J as JwtService

    V->>F: formulaire + case de consentement
    F->>A: POST /api/v1/auth/register
    A->>A: validation (@Valid) — consentement obligatoire
    alt champ invalide ou consentement absent
        A-->>F: 400 VALIDATION_FAILED + détail par champ
    end
    A->>U: register(requête)
    U->>R: existsByEmailIgnoreCase
    alt adresse déjà connue
        U-->>A: ConflictException
        A-->>F: 409 CONFLICT
    end
    U->>P: encode(mot de passe) — BCrypt coût 12
    U->>R: save(User + version et date du consentement)
    U-->>A: User
    A->>J: issueToken
    A-->>F: 201 jeton + profil
    F-->>V: redirection vers le niveau A1
```

## 3.5 États d'une progression

```mermaid
stateDiagram-v2
    [*] --> NonCommencée
    NonCommencée --> EnCours: start ou première réponse
    EnCours --> EnCours: réponse (score += points si première réussite)
    EnCours --> Terminée: complete
    Terminée --> Terminée: nouvelles réponses (score conservé, sans double comptage)
    Terminée --> [*]: suppression du compte
    EnCours --> [*]: suppression du compte
```

`NonCommencée` n'est pas stocké : c'est l'absence de ligne dans `lesson_progress`.
