-- =====================================================================
-- French Voyage Akademie — schéma de base
-- Version 1 : utilisateurs, catalogue académique, progression.
--
-- Principe de conception : tout texte destiné à l'utilisateur vit dans
-- une table `*_translations` indexée par `locale`. Ajouter l'espagnol ou
-- l'allemand consiste donc à insérer des lignes, jamais à modifier le
-- schéma (objectif spécifique n°9 du projet de service social).
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Utilisateurs
-- ---------------------------------------------------------------------
CREATE TABLE users (
    id                      BIGSERIAL    PRIMARY KEY,
    email                   VARCHAR(190) NOT NULL,
    password_hash           VARCHAR(100) NOT NULL,
    display_name            VARCHAR(80)  NOT NULL,
    interface_locale        VARCHAR(8)   NOT NULL DEFAULT 'en',
    role                    VARCHAR(20)  NOT NULL DEFAULT 'ROLE_STUDENT',
    enabled                 BOOLEAN      NOT NULL DEFAULT TRUE,
    privacy_consent_version VARCHAR(20),
    privacy_consent_at      TIMESTAMPTZ,
    last_login_at           TIMESTAMPTZ,
    created_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at              TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_users_email UNIQUE (email),
    CONSTRAINT ck_users_role  CHECK (role IN ('ROLE_STUDENT', 'ROLE_ADMIN'))
);

COMMENT ON TABLE  users IS 'Comptes des apprenants. Minimisation RGPD : aucune donnée non nécessaire au service.';
COMMENT ON COLUMN users.password_hash IS 'Empreinte BCrypt. Le mot de passe en clair n''est jamais stocké ni journalisé.';

-- ---------------------------------------------------------------------
-- 2. Catalogue académique : niveaux CECR
-- ---------------------------------------------------------------------
CREATE TABLE levels (
    id         BIGSERIAL   PRIMARY KEY,
    code       VARCHAR(8)  NOT NULL,
    position   INTEGER     NOT NULL,
    published  BOOLEAN     NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_levels_code     UNIQUE (code),
    CONSTRAINT uq_levels_position UNIQUE (position)
);

CREATE TABLE level_translations (
    level_id    BIGINT       NOT NULL REFERENCES levels (id) ON DELETE CASCADE,
    locale      VARCHAR(8)   NOT NULL,
    name        VARCHAR(120) NOT NULL,
    description TEXT,
    PRIMARY KEY (level_id, locale)
);

-- ---------------------------------------------------------------------
-- 3. Unités
-- ---------------------------------------------------------------------
CREATE TABLE units (
    id         BIGSERIAL   PRIMARY KEY,
    level_id   BIGINT      NOT NULL REFERENCES levels (id) ON DELETE CASCADE,
    slug       VARCHAR(90) NOT NULL,
    position   INTEGER     NOT NULL,
    published  BOOLEAN     NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_units_slug     UNIQUE (slug),
    CONSTRAINT uq_units_position UNIQUE (level_id, position)
);

CREATE TABLE unit_translations (
    unit_id     BIGINT       NOT NULL REFERENCES units (id) ON DELETE CASCADE,
    locale      VARCHAR(8)   NOT NULL,
    title       VARCHAR(180) NOT NULL,
    description TEXT,
    PRIMARY KEY (unit_id, locale)
);

CREATE INDEX ix_units_level ON units (level_id, position);

-- ---------------------------------------------------------------------
-- 4. Leçons
-- ---------------------------------------------------------------------
CREATE TABLE lessons (
    id                BIGSERIAL   PRIMARY KEY,
    unit_id           BIGINT      NOT NULL REFERENCES units (id) ON DELETE CASCADE,
    slug              VARCHAR(90) NOT NULL,
    position          INTEGER     NOT NULL,
    estimated_minutes INTEGER     NOT NULL DEFAULT 25,
    published         BOOLEAN     NOT NULL DEFAULT FALSE,
    created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_lessons_slug     UNIQUE (slug),
    CONSTRAINT uq_lessons_position UNIQUE (unit_id, position),
    CONSTRAINT ck_lessons_minutes  CHECK (estimated_minutes BETWEEN 1 AND 240)
);

CREATE TABLE lesson_translations (
    lesson_id BIGINT       NOT NULL REFERENCES lessons (id) ON DELETE CASCADE,
    locale    VARCHAR(8)   NOT NULL,
    title     VARCHAR(180) NOT NULL,
    summary   TEXT,
    objective TEXT,
    PRIMARY KEY (lesson_id, locale)
);

CREATE INDEX ix_lessons_unit ON lessons (unit_id, position);

-- ---------------------------------------------------------------------
-- 5. Sections d'une leçon (contenu, grammaire, culture, média)
-- ---------------------------------------------------------------------
CREATE TABLE lesson_sections (
    id           BIGSERIAL   PRIMARY KEY,
    lesson_id    BIGINT      NOT NULL REFERENCES lessons (id) ON DELETE CASCADE,
    position     INTEGER     NOT NULL,
    section_type VARCHAR(24) NOT NULL,
    media_url    TEXT,
    media_type   VARCHAR(16),
    CONSTRAINT uq_sections_position UNIQUE (lesson_id, position),
    CONSTRAINT ck_sections_type CHECK (
        section_type IN ('INTRODUCTION', 'GRAMMAR', 'VOCABULARY', 'PRONUNCIATION',
                         'CULTURE', 'READING', 'MEDIA', 'SUMMARY')),
    CONSTRAINT ck_sections_media_type CHECK (
        media_type IS NULL OR media_type IN ('VIDEO', 'AUDIO', 'IMAGE', 'LINK'))
);

CREATE TABLE lesson_section_translations (
    section_id BIGINT       NOT NULL REFERENCES lesson_sections (id) ON DELETE CASCADE,
    locale     VARCHAR(8)   NOT NULL,
    title      VARCHAR(180) NOT NULL,
    body       TEXT,
    PRIMARY KEY (section_id, locale)
);

COMMENT ON COLUMN lesson_section_translations.body IS 'Contenu rédigé en Markdown restreint (titres, listes, gras, tableaux).';

-- ---------------------------------------------------------------------
-- 6. Vocabulaire
-- ---------------------------------------------------------------------
CREATE TABLE vocabulary_items (
    id               BIGSERIAL    PRIMARY KEY,
    lesson_id        BIGINT       NOT NULL REFERENCES lessons (id) ON DELETE CASCADE,
    position         INTEGER      NOT NULL,
    term             VARCHAR(160) NOT NULL,
    phonetic         VARCHAR(160),
    example_sentence TEXT,
    audio_url        TEXT,
    CONSTRAINT uq_vocabulary_position UNIQUE (lesson_id, position)
);

COMMENT ON COLUMN vocabulary_items.term IS 'Le terme en français : langue enseignée, donc non traduite.';

CREATE TABLE vocabulary_translations (
    item_id     BIGINT       NOT NULL REFERENCES vocabulary_items (id) ON DELETE CASCADE,
    locale      VARCHAR(8)   NOT NULL,
    translation VARCHAR(220) NOT NULL,
    note        TEXT,
    PRIMARY KEY (item_id, locale)
);

-- ---------------------------------------------------------------------
-- 7. Exercices
-- ---------------------------------------------------------------------
CREATE TABLE exercises (
    id            BIGSERIAL   PRIMARY KEY,
    lesson_id     BIGINT      NOT NULL REFERENCES lessons (id) ON DELETE CASCADE,
    position      INTEGER     NOT NULL,
    exercise_type VARCHAR(24) NOT NULL,
    points        INTEGER     NOT NULL DEFAULT 1,
    CONSTRAINT uq_exercises_position UNIQUE (lesson_id, position),
    CONSTRAINT ck_exercises_type   CHECK (exercise_type IN ('MULTIPLE_CHOICE', 'TRUE_FALSE', 'FILL_BLANK')),
    CONSTRAINT ck_exercises_points CHECK (points BETWEEN 1 AND 10)
);

CREATE TABLE exercise_translations (
    exercise_id BIGINT     NOT NULL REFERENCES exercises (id) ON DELETE CASCADE,
    locale      VARCHAR(8) NOT NULL,
    prompt      TEXT       NOT NULL,
    explanation TEXT,
    PRIMARY KEY (exercise_id, locale)
);

COMMENT ON COLUMN exercise_translations.explanation IS 'Retour pédagogique affiché après la réponse, quelle qu''elle soit.';

-- Options proposées (QCM et vrai/faux).
CREATE TABLE exercise_options (
    id          BIGSERIAL    PRIMARY KEY,
    exercise_id BIGINT       NOT NULL REFERENCES exercises (id) ON DELETE CASCADE,
    position    INTEGER      NOT NULL,
    label       VARCHAR(220) NOT NULL,
    correct     BOOLEAN      NOT NULL DEFAULT FALSE,
    CONSTRAINT uq_options_position UNIQUE (exercise_id, position)
);

COMMENT ON COLUMN exercise_options.label IS 'Libellé par défaut, en français. Surchargeable par langue via exercise_option_translations.';

CREATE TABLE exercise_option_translations (
    option_id BIGINT       NOT NULL REFERENCES exercise_options (id) ON DELETE CASCADE,
    locale    VARCHAR(8)   NOT NULL,
    label     VARCHAR(220) NOT NULL,
    PRIMARY KEY (option_id, locale)
);

-- Réponses attendues pour les exercices à saisie libre (texte à trous).
CREATE TABLE exercise_answers (
    id                BIGSERIAL    PRIMARY KEY,
    exercise_id       BIGINT       NOT NULL REFERENCES exercises (id) ON DELETE CASCADE,
    normalized_answer VARCHAR(220) NOT NULL
);

COMMENT ON COLUMN exercise_answers.normalized_answer IS
    'Réponse en minuscules, sans accents ni ponctuation : la comparaison est indulgente sur la casse et les accents.';

CREATE INDEX ix_exercise_answers_exercise ON exercise_answers (exercise_id);

-- ---------------------------------------------------------------------
-- 8. Progression de l'apprenant
-- ---------------------------------------------------------------------
CREATE TABLE lesson_progress (
    id           BIGSERIAL   PRIMARY KEY,
    user_id      BIGINT      NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    lesson_id    BIGINT      NOT NULL REFERENCES lessons (id) ON DELETE CASCADE,
    status       VARCHAR(16) NOT NULL DEFAULT 'IN_PROGRESS',
    score        INTEGER     NOT NULL DEFAULT 0,
    max_score    INTEGER     NOT NULL DEFAULT 0,
    started_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    completed_at TIMESTAMPTZ,
    updated_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_progress_user_lesson UNIQUE (user_id, lesson_id),
    CONSTRAINT ck_progress_status CHECK (status IN ('IN_PROGRESS', 'COMPLETED')),
    CONSTRAINT ck_progress_score  CHECK (score >= 0 AND max_score >= 0)
);

CREATE INDEX ix_progress_user ON lesson_progress (user_id);

CREATE TABLE exercise_attempts (
    id               BIGSERIAL   PRIMARY KEY,
    user_id          BIGINT      NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    exercise_id      BIGINT      NOT NULL REFERENCES exercises (id) ON DELETE CASCADE,
    submitted_answer TEXT,
    correct          BOOLEAN     NOT NULL,
    points_awarded   INTEGER     NOT NULL DEFAULT 0,
    attempted_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX ix_attempts_user_exercise ON exercise_attempts (user_id, exercise_id);
