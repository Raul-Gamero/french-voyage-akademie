-- ==================================================================
-- Contenu académique — niveau A1, unité 1
-- Unité 1 — Premier contact
--
-- FICHIER GÉNÉRÉ. Ne pas modifier à la main : éditer
--   content/a1/unit-1.json
-- puis relancer  python tools/generate_seed.py
-- ==================================================================

-- Unité 1 : Unité 1 — Premier contact
INSERT INTO units (level_id, slug, position, published)
SELECT id, 'a1-unit-1', 1, TRUE
FROM levels WHERE code = 'A1';

INSERT INTO unit_translations (unit_id, locale, title, description)
SELECT id, 'en', 'Unit 1 — First contact', 'Introduce yourself, say the alphabet, count, tell the time, describe people, talk about your family, your travel plans and your first purchases.'
FROM units WHERE slug = 'a1-unit-1';
INSERT INTO unit_translations (unit_id, locale, title, description)
SELECT id, 'fr', 'Unité 1 — Premier contact', 'Se présenter, épeler, compter, dire l''heure, décrire une personne, parler de sa famille, de ses déplacements et de ses premiers achats.'
FROM units WHERE slug = 'a1-unit-1';

-- ------------------------------------------------------------------
-- Leçon 1 : Se présenter
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l01-se-presenter', 1, 30, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Introducing yourself', 'Say your name, where you are from, and use the two most important French verbs.', 'Can introduce themselves and others, and ask and answer simple questions about personal details.'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Se présenter', 'Dire son nom, son origine, et employer les deux verbes les plus importants du français.', 'Peut se présenter et présenter quelqu''un, poser des questions simples sur des informations personnelles et y répondre.'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'INTRODUCTION', NULL, NULL
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The first sentences you will need', 'Four sentences already let you open a conversation:

- **Bonjour.** — Hello.
- **Je m''appelle Ana.** — My name is Ana.
- **Je suis salvadorienne.** — I am Salvadoran.
- **Et vous ?** — And you?

In French, **vous** is the polite form. Use it with anyone you do not know: at the town hall, at the doctor''s, at a job interview. **Tu** is for family, friends and children.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les premières phrases utiles', 'Quatre phrases suffisent déjà pour ouvrir une conversation :

- **Bonjour.**
- **Je m''appelle Ana.**
- **Je suis salvadorienne.**
- **Et vous ?**

En français, **vous** est la forme de politesse. On l''emploie avec toute personne que l''on ne connaît pas : à la mairie, chez le médecin, lors d''un entretien d''embauche. **Tu** est réservé à la famille, aux amis et aux enfants.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=Lvs2OvBKSGU', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Être and avoir in the present tense', 'These two verbs are irregular, and you cannot avoid them: they build almost every other tense.

| | être (to be) | avoir (to have) |
|---|---|---|
| je | suis | ai |
| tu | es | as |
| il / elle | est | a |
| nous | sommes | avons |
| vous | êtes | avez |
| ils / elles | sont | ont |

Watch the difference with English: French says **j''ai 30 ans** (*I have 30 years*), never *je suis 30 ans*. The same goes for hunger, thirst and cold: **j''ai faim, j''ai soif, j''ai froid**.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Être et avoir au présent', 'Ces deux verbes sont irréguliers et incontournables : presque tous les autres temps se construisent avec eux.

| | être | avoir |
|---|---|---|
| je | suis | ai |
| tu | es | as |
| il / elle | est | a |
| nous | sommes | avons |
| vous | êtes | avez |
| ils / elles | sont | ont |

Attention : on dit **j''ai 30 ans**, jamais *je suis 30 ans*. De même pour les sensations : **j''ai faim, j''ai soif, j''ai froid**.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', 'https://www.youtube.com/watch?v=8dOny8bh8bQ', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Useful classroom phrases', 'Learn these before anything else. They let you keep going when you do not understand:

- **Je ne comprends pas.** — I don''t understand.
- **Pouvez-vous répéter, s''il vous plaît ?** — Can you repeat, please?
- **Comment dit-on … en français ?** — How do you say … in French?
- **Qu''est-ce que ça veut dire ?** — What does that mean?

Saying *je ne comprends pas* is not a failure. It is the sentence that keeps the conversation alive.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Phrases utiles en classe', 'À apprendre avant tout le reste : ces phrases permettent de continuer quand on ne comprend pas.

- **Je ne comprends pas.**
- **Pouvez-vous répéter, s''il vous plaît ?**
- **Comment dit-on … en français ?**
- **Qu''est-ce que ça veut dire ?**

Dire *je ne comprends pas* n''est pas un échec : c''est la phrase qui maintient la conversation en vie.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'bonjour', 'bɔ̃.ʒuʁ', 'Bonjour, madame.'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'hello, good morning', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'salutation employée pendant la journée', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'bonsoir', 'bɔ̃.swaʁ', 'Bonsoir, monsieur.'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'good evening', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'salutation employée à partir de la fin d''après-midi', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 's''appeler', 'sa.p(ə).le', 'Je m''appelle Ana. Et vous, comment vous appelez-vous ?'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to be called', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir pour nom', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'enchanté(e)', 'ɑ̃.ʃɑ̃.te', '— Je m''appelle Karim. — Enchantée !'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'pleased to meet you', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'formule de politesse lors d''une première rencontre', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 's''il vous plaît', 'sil.vu.plɛ', 'Un café, s''il vous plaît.'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'please (polite form)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'formule de politesse pour demander quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'merci', 'mɛʁ.si', 'Merci beaucoup !'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'thank you', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'formule de remerciement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'au revoir', 'o.ʁə.vwaʁ', 'Au revoir et bonne journée !'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'goodbye', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'formule que l''on emploie en partant', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un prénom', 'pʁe.nɔ̃', 'Mon prénom est Ana, mon nom est Ramos.'
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a first name', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le nom personnel, placé avant le nom de famille', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ___ étudiante. »', 'With a noun describing who you are, French uses être: je suis étudiante.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ___ étudiante. »', 'Pour dire qui l''on est, on emploie le verbe être : je suis étudiante.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'suis', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'ai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'es', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'est', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''___ vingt-cinq ans. »', 'Age uses avoir in French: j''ai vingt-cinq ans. Saying « je suis vingt-cinq ans » is a very common first-language interference.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''___ vingt-cinq ans. »', 'L''âge se dit avec avoir : j''ai vingt-cinq ans. « Je suis vingt-cinq ans » est un calque fréquent de l''anglais et de l''espagnol.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'ai', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'suis', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'as', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'est', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Write in French: « My name is Marie. » (use s''appeler)', 'S''appeler is a reflexive verb: the pronoun me comes before the verb — je m''appelle Marie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Écrivez en français : « Mon nom est Marie. » (employez s''appeler)', 'S''appeler est un verbe pronominal : le pronom me précède le verbe — je m''appelle Marie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je m''appelle marie'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je mappelle marie'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'At the town hall, you should address the clerk with « tu ».', 'False. In any administrative or professional setting, use vous. Tu with a stranger sounds abrupt.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'À la mairie, on s''adresse à l''agent avec « tu ».', 'Faux. Dans tout cadre administratif ou professionnel, on emploie vous. Le tutoiement d''un inconnu est perçu comme brusque.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 4 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l01-se-presenter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You did not understand what someone said. What do you say?', '« Pouvez-vous répéter, s''il vous plaît ? » is polite and clear. Keep it ready — you will use it every day.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Vous n''avez pas compris ce qu''on vous a dit. Que dites-vous ?', '« Pouvez-vous répéter, s''il vous plaît ? » est poli et clair. Gardez cette phrase à portée : elle sert tous les jours.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Pouvez-vous répéter, s''il vous plaît ?', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je m''appelle, s''il vous plaît.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Au revoir, merci.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l01-se-presenter' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 2 : L'alphabet et les sons
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l02-alphabet-et-sons', 2, 30, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'The alphabet and French sounds', 'Spell your name on the phone and recognise the sounds that do not exist in your language.', 'Can spell their name and address, and distinguish the main French vowel sounds.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'L''alphabet et les sons', 'Épeler son nom au téléphone et reconnaître les sons qui n''existent pas dans sa langue.', 'Peut épeler son nom et son adresse, et distinguer les principaux sons vocaliques du français.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'PRONUNCIATION', 'https://www.youtube.com/watch?v=akKplmnr01M', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The alphabet', 'Spelling out loud is a survival skill: every administrative desk will ask you to spell your surname.

The letters that cause the most trouble:

| Letter | Sounds like | Do not confuse with |
|---|---|---|
| E | *euh* | A (*ah*) |
| G | *jé* | J (*ji*) |
| I | *i* | E |
| U | *u* (lips rounded) | OU |
| Y | *i grec* | I |
| W | *double vé* | V |

Useful phrase: **Ça s''écrit R-A-M-O-S.** — It is spelled R-A-M-O-S.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'L''alphabet', 'Épeler est une compétence de survie : tout guichet administratif vous demandera d''épeler votre nom de famille.

Les lettres les plus délicates :

| Lettre | Se prononce | Ne pas confondre avec |
|---|---|---|
| E | *euh* | A |
| G | *jé* | J (*ji*) |
| I | *i* | E |
| U | *u*, lèvres arrondies | OU |
| Y | *i grec* | I |
| W | *double vé* | V |

Phrase utile : **Ça s''écrit R-A-M-O-S.**'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'PRONUNCIATION', 'https://www.youtube.com/watch?v=-NfSx_Egico', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Three sounds to master early', '**1. [u] versus [y]** — *tout* (all) and *tu* (you) differ only in lip position. For [y], say *i* and round your lips.

**2. The nasal vowels** — [ɑ̃] in *grand*, [ɔ̃] in *bon*, [ɛ̃] in *pain*. The air passes through the nose; the final n is not pronounced as a consonant.

**3. The silent final letters** — *petit*, *grand*, *vous parlez*: the final consonant is usually silent. A final **e** is silent too, but it makes the preceding consonant audible: *petit* [pəti] / *petite* [pətit].'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Trois sons à travailler tôt', '**1. [u] contre [y]** — *tout* et *tu* ne diffèrent que par la position des lèvres. Pour [y], dites *i* puis arrondissez les lèvres.

**2. Les voyelles nasales** — [ɑ̃] dans *grand*, [ɔ̃] dans *bon*, [ɛ̃] dans *pain*. L''air passe par le nez et le n final ne se prononce pas comme une consonne.

**3. Les lettres finales muettes** — *petit*, *grand*, *vous parlez* : la consonne finale est le plus souvent muette. Le **e** final est muet lui aussi, mais il rend audible la consonne qui le précède : *petit* [pəti] / *petite* [pətit].'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Accents change the sound, and sometimes the word', '- **é** (accent aigu) — closed sound: *café*, *étudiant*
- **è / ê** (accent grave / circonflexe) — open sound: *père*, *fenêtre*
- **ç** (cédille) — c pronounced [s] before a, o, u: *français*, *ça*
- **à / où** — the accent separates two different words: *a* (has) / *à* (to), *ou* (or) / *où* (where)

On a phone keyboard, hold a vowel down to get its accented forms.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les accents changent le son, parfois le mot', '- **é** (accent aigu) — son fermé : *café*, *étudiant*
- **è / ê** (accent grave, circonflexe) — son ouvert : *père*, *fenêtre*
- **ç** (cédille) — le c se prononce [s] devant a, o, u : *français*, *ça*
- **à / où** — l''accent distingue deux mots différents : *a* (verbe avoir) / *à* (préposition), *ou* (choix) / *où* (lieu)

Sur un clavier de téléphone, maintenez une voyelle enfoncée pour obtenir ses formes accentuées.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'épeler', 'e.p(ə).le', 'Pouvez-vous épeler votre nom ?'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to spell', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'dire un mot lettre par lettre', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'une lettre', 'lɛtʁ', 'Le mot « chat » a quatre lettres.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a letter', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'signe de l''alphabet', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'un accent', 'ak.sɑ̃', '« Café » prend un accent aigu.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an accent mark', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'signe placé sur une voyelle', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'une majuscule', 'ma.ʒys.kyl', 'Les noms propres prennent une majuscule.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a capital letter', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'grande lettre, comme A ou B', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'un mot', 'mo', 'Je ne connais pas ce mot.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a word', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'unité de la langue', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'une phrase', 'fʁɑz', 'Écrivez une phrase complète.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a sentence', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'suite de mots qui a un sens complet', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'un nom de famille', 'nɔ̃.d(ə).fa.mij', 'Mon nom de famille est Ramos.'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a surname, family name', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'nom transmis par la famille', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 's''écrire', 'se.kʁiʁ', 'Comment ça s''écrit ?'
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to be written, to be spelled', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir telle orthographe', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which pair differs only by the position of the lips?', 'tout [tu] / tu [ty]. For [y], the tongue stays in the [i] position while the lips round.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle paire ne se distingue que par la position des lèvres ?', 'tout [tu] / tu [ty]. Pour [y], la langue reste en position [i] pendant que les lèvres s''arrondissent.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'tout / tu', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'chat / chien', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'père / mère', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which word contains a nasal vowel?', 'In « pain », the air passes through the nose and the n is not pronounced separately.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel mot contient une voyelle nasale ?', 'Dans « pain », l''air passe par le nez et le n ne se prononce pas séparément.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'pain', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'papa', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'ville', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'café', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 1
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Add the missing accent: « Je suis etudiant. »', 'étudiant, with an accent aigu. The é is a closed sound; without the accent the word does not exist.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Rétablissez l''accent manquant : « Je suis etudiant. »', 'étudiant, avec un accent aigu. Le é est un son fermé ; sans l''accent, le mot n''existe pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'étudiant'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'etudiant'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In « petit », the final t is pronounced.', 'False. It stays silent — but it is heard in the feminine « petite », because the final e makes it audible.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dans « petit », le t final se prononce.', 'Faux. Il reste muet — mais on l''entend au féminin « petite », car le e final le rend audible.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 4 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l02-alphabet-et-sons';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'A clerk asks « Comment ça s''écrit ? ». What do they want?', 'They want you to spell the word, letter by letter.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Un agent vous demande « Comment ça s''écrit ? ». Que veut-il ?', 'Il vous demande d''épeler le mot, lettre par lettre.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Que vous épeliez le mot', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Que vous répétiez plus fort', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Que vous traduisiez le mot', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l02-alphabet-et-sons' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 3 : Les nombres, les jours et l'heure
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l03-nombres-et-heure', 3, 35, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Numbers, days and telling the time', 'Count, give a date, read an appointment letter and understand opening hours.', 'Can handle numbers, quantities, dates and times in everyday transactions.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les nombres, les jours et l''heure', 'Compter, donner une date, lire une convocation et comprendre des horaires d''ouverture.', 'Peut manier les nombres, les quantités, les dates et les heures dans les échanges quotidiens.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=Y3E9xLNZ9iE', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Numbers from 0 to 100', '0 zéro · 1 un · 2 deux · 3 trois · 4 quatre · 5 cinq · 6 six · 7 sept · 8 huit · 9 neuf · 10 dix
11 onze · 12 douze · 13 treize · 14 quatorze · 15 quinze · 16 seize · 17 dix-sept · 18 dix-huit · 19 dix-neuf · 20 vingt

Then 30 trente, 40 quarante, 50 cinquante, 60 soixante.

From 70 on, French counts in a way that surprises everyone at first:

- 70 = **soixante-dix** (60 + 10)
- 80 = **quatre-vingts** (4 × 20)
- 90 = **quatre-vingt-dix** (4 × 20 + 10)
- 97 = **quatre-vingt-dix-sept**

In Belgium and Switzerland you will hear *septante* (70) and *nonante* (90) instead — both are correct French.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les nombres de 0 à 100', '0 zéro · 1 un · 2 deux · 3 trois · 4 quatre · 5 cinq · 6 six · 7 sept · 8 huit · 9 neuf · 10 dix
11 onze · 12 douze · 13 treize · 14 quatorze · 15 quinze · 16 seize · 17 dix-sept · 18 dix-huit · 19 dix-neuf · 20 vingt

Puis 30 trente, 40 quarante, 50 cinquante, 60 soixante.

À partir de 70, le français compte d''une manière qui surprend tout le monde :

- 70 = **soixante-dix** (60 + 10)
- 80 = **quatre-vingts** (4 × 20)
- 90 = **quatre-vingt-dix** (4 × 20 + 10)
- 97 = **quatre-vingt-dix-sept**

En Belgique et en Suisse, on entend *septante* (70) et *nonante* (90) : ces formes sont également correctes.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', 'https://www.youtube.com/watch?v=CrX86g3IooQ', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Days, months and seasons', '**Days** — lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche.

**Months** — janvier, février, mars, avril, mai, juin, juillet, août, septembre, octobre, novembre, décembre.

**Seasons** — le printemps, l''été, l''automne, l''hiver.

Days and months take **no capital letter** in French. Dates are written day first: **le 14 juillet 2026**, that is 14/07/2026. An appointment letter reading *le 3/4* means 3 April, not 4 March — a mistake worth avoiding.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les jours, les mois et les saisons', '**Les jours** — lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche.

**Les mois** — janvier, février, mars, avril, mai, juin, juillet, août, septembre, octobre, novembre, décembre.

**Les saisons** — le printemps, l''été, l''automne, l''hiver.

Les jours et les mois **ne prennent pas de majuscule**. La date s''écrit en commençant par le jour : **le 14 juillet 2026**, soit 14/07/2026. Une convocation indiquant *le 3/4* désigne le 3 avril, non le 4 mars — une confusion qu''il vaut mieux éviter.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', 'https://www.youtube.com/watch?v=5wH0W88MiT0', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Telling the time', 'Ask: **Quelle heure est-il ?** Answer: **Il est …**

- 8:00 — il est huit heures
- 8:15 — il est huit heures quinze / et quart
- 8:30 — il est huit heures trente / et demie
- 8:45 — il est huit heures quarante-cinq / neuf heures moins le quart

Official contexts — trains, appointments, opening hours — use the **24-hour clock**: *le train part à 18 h 40*, *le bureau ferme à 17 h*. Note that *midi* is 12:00 and *minuit* is 00:00.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Dire l''heure', 'Question : **Quelle heure est-il ?** Réponse : **Il est …**

- 8 h 00 — il est huit heures
- 8 h 15 — il est huit heures quinze / et quart
- 8 h 30 — il est huit heures trente / et demie
- 8 h 45 — il est huit heures quarante-cinq / neuf heures moins le quart

Les contextes officiels — trains, rendez-vous, horaires d''ouverture — emploient l''**heure sur 24 heures** : *le train part à 18 h 40*, *le bureau ferme à 17 h*. Retenez aussi *midi* (12 h) et *minuit* (0 h).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'un rendez-vous', 'ʁɑ̃.de.vu', 'J''ai un rendez-vous à la préfecture mardi.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an appointment', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'rencontre fixée à une date et une heure', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'aujourd''hui', 'o.ʒuʁ.dɥi', 'Aujourd''hui, nous sommes lundi.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'today', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le jour où l''on parle', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'demain', 'd(ə).mɛ̃', 'Le bureau ouvre demain à neuf heures.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'tomorrow', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le jour suivant', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'hier', 'jɛʁ', 'Hier, j''ai reçu une lettre.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'yesterday', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le jour précédent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'une semaine', 's(ə).mɛn', 'La semaine prochaine, je commence les cours.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a week', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'période de sept jours', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'ouvert / fermé', 'u.vɛʁ / fɛʁ.me', 'La mairie est fermée le dimanche.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'open / closed', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'accessible au public / inaccessible', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'midi', 'mi.di', 'Le magasin ferme à midi.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'noon, 12:00', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'douze heures, le milieu de la journée', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'en retard', 'ɑ̃.ʁ(ə).taʁ', 'Excusez-moi, je suis en retard.'
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'late', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'après l''heure prévue', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'How do you say 80 in standard French?', 'quatre-vingts, literally « four twenties ». In Belgium and Switzerland, huitante or octante also exist.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Comment dit-on 80 en français standard ?', 'quatre-vingts, littéralement « quatre fois vingt ». En Belgique et en Suisse, on entend aussi huitante ou octante.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'quatre-vingts', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'huitante', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'octante', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'quatre-dix', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Write 75 in words.', 'soixante-quinze — 60 + 15. From 70 to 79, French keeps counting on from soixante.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Écrivez 75 en toutes lettres.', 'soixante-quinze — 60 + 15. De 70 à 79, le français continue de compter à partir de soixante.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 2;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'soixante-quinze'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 2;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'soixante quinze'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Your appointment letter says « le 05/09 ». Which date is it?', '5 September. In French the day comes first, then the month — the opposite of the US format.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Votre convocation indique « le 05/09 ». De quelle date s''agit-il ?', 'Le 5 septembre. En français, le jour précède le mois — l''inverse du format états-unien.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Le 5 septembre', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Le 9 mai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Le 9 septembre', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Days of the week take a capital letter in French.', 'False. Unlike English, French writes lundi, mardi, janvier without a capital.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Les jours de la semaine prennent une majuscule en français.', 'Faux. Contrairement à l''anglais, on écrit lundi, mardi, janvier sans majuscule.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 4 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l03-nombres-et-heure';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Le train part à 18 h 40. » What time is that?', '6:40 p.m. Timetables always use the 24-hour clock.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Le train part à 18 h 40. » Quelle heure est-ce ?', 'Six heures quarante du soir. Les horaires officiels emploient toujours l''heure sur 24 heures.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, '18 h 40 (6:40 du soir)', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, '8 h 40 du matin', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Minuit quarante', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l03-nombres-et-heure' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 4 : Décrire une personne
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l04-decrire-une-personne', 4, 30, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Describing people', 'Colours, the body and adjectives that agree — describe yourself and others.', 'Can describe people, their appearance and their basic state of health.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Décrire une personne', 'Les couleurs, le corps et l''accord des adjectifs — se décrire et décrire les autres.', 'Peut décrire des personnes, leur apparence et leur état de santé élémentaire.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=FU7rYQfLiwY', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Adjectives agree — and usually follow the noun', 'A French adjective changes with the noun it describes:

| | masculine | feminine |
|---|---|---|
| singular | un homme grand | une femme grande |
| plural | des hommes grands | des femmes grandes |

The general rule: **+ e** for the feminine, **+ s** for the plural.

Most adjectives come **after** the noun — *une voiture rouge*, *un café chaud*. A small, very frequent group comes before: **beau, bon, grand, petit, jeune, vieux, joli, nouveau**. So: *une petite maison*, but *une maison blanche*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'L''adjectif s''accorde — et se place le plus souvent après le nom', 'L''adjectif français varie avec le nom qu''il qualifie :

| | masculin | féminin |
|---|---|---|
| singulier | un homme grand | une femme grande |
| pluriel | des hommes grands | des femmes grandes |

Règle générale : **+ e** au féminin, **+ s** au pluriel.

La plupart des adjectifs se placent **après** le nom — *une voiture rouge*, *un café chaud*. Un petit groupe très fréquent se place avant : **beau, bon, grand, petit, jeune, vieux, joli, nouveau**. On dira donc *une petite maison*, mais *une maison blanche*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', 'https://www.youtube.com/watch?v=13yD_eIzecg', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Colours', 'blanc / blanche · noir / noire · rouge · bleu / bleue · vert / verte · jaune · gris / grise · marron · rose · orange

**rouge, jaune, rose** already end in -e: they do not change in the feminine.
**marron** and **orange** come from nouns (a chestnut, an orange) and never change at all: *des chaussures marron*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les couleurs', 'blanc / blanche · noir / noire · rouge · bleu / bleue · vert / verte · jaune · gris / grise · marron · rose · orange

**rouge, jaune, rose** se terminent déjà par -e : ils ne changent pas au féminin.
**marron** et **orange** viennent de noms (un marron, une orange) et restent invariables : *des chaussures marron*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', 'https://www.youtube.com/watch?v=mlpYaf4UY5E', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The body — and saying where it hurts', 'la tête · les yeux · le nez · la bouche · les dents · la gorge · le dos · le ventre · le bras · la jambe · le pied · la main

At the doctor''s, one structure does most of the work:

**J''ai mal à …** — *j''ai mal à la tête*, *j''ai mal au dos*, *j''ai mal aux dents*.

Watch the contraction: à + le = **au**, à + les = **aux**.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le corps — et dire où l''on a mal', 'la tête · les yeux · le nez · la bouche · les dents · la gorge · le dos · le ventre · le bras · la jambe · le pied · la main

Chez le médecin, une seule structure suffit dans la plupart des cas :

**J''ai mal à …** — *j''ai mal à la tête*, *j''ai mal au dos*, *j''ai mal aux dents*.

Attention à la contraction : à + le = **au**, à + les = **aux**.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'grand(e)', 'ɡʁɑ̃ / ɡʁɑ̃d', 'Ma sœur est grande.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'tall, big', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'de taille élevée', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'petit(e)', 'p(ə).ti / p(ə).tit', 'J''habite dans un petit appartement.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'small, short', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'de taille réduite', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'les cheveux', 'ʃ(ə).vø', 'Elle a les cheveux noirs.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'hair', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ce qui pousse sur la tête', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'les yeux', 'jø', 'Il a les yeux verts.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'eyes', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'organes de la vue ; singulier : un œil', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'avoir mal à', 'a.vwaʁ.mal.a', 'J''ai mal à la gorge depuis hier.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to have a pain in, to hurt', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ressentir une douleur quelque part', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'fatigué(e)', 'fa.ti.ɡe', 'Je suis très fatigué aujourd''hui.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'tired', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui manque d''énergie', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'sympathique', 'sɛ̃.pa.tik', 'Mon voisin est très sympathique.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'nice, friendly', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'agréable, aimable ; familier : sympa', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un médecin', 'med.sɛ̃', 'Je dois voir un médecin.'
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a doctor', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'personne qui soigne les malades', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Marie est ___. »', 'Marie is feminine, so the adjective takes an e: grande.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Marie est ___. »', 'Marie est un nom féminin : l''adjectif prend un e — grande.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'grande', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'grand', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'grands', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which phrase is correct?', 'une voiture rouge — most adjectives, and colours in particular, follow the noun.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle expression est correcte ?', 'une voiture rouge — la plupart des adjectifs, et les couleurs en particulier, suivent le nom.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'une voiture rouge', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'une rouge voiture', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'At the doctor''s, say that your back hurts.', 'j''ai mal au dos — à + le contracts to au. « à le dos » is never correct.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Chez le médecin, dites que vous avez mal au dos.', 'j''ai mal au dos — à + le se contracte en au. « à le dos » n''est jamais correct.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'j''ai mal au dos'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'jai mal au dos'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« marron » changes in the feminine: une veste marronne.', 'False. Colours taken from nouns — marron, orange — never change: une veste marron.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« marron » varie au féminin : une veste marronne.', 'Faux. Les couleurs issues de noms — marron, orange — restent invariables : une veste marron.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 4 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l04-decrire-une-personne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''ai mal ___ dents. »', 'aux dents — à + les becomes aux before a plural noun.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''ai mal ___ dents. »', 'aux dents — à + les devient aux devant un nom pluriel.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'aux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'à les', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'au', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'à la', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l04-decrire-une-personne' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 5 : Le présent de l'indicatif et dire où l'on habite
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l05-present-et-habiter', 5, 35, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'The present tense and saying where you live', 'Regular -er verbs, and the prepositions that go with countries and cities.', 'Can talk about where they live and come from, and describe habitual actions.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Le présent de l''indicatif et dire où l''on habite', 'Les verbes réguliers en -er, et les prépositions des villes et des pays.', 'Peut dire où il ou elle habite et d''où il ou elle vient, et décrire des actions habituelles.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=5noY8tSjmDk', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Regular -er verbs: one pattern, hundreds of verbs', 'About 90 % of French verbs end in **-er** and follow one single pattern. Learn it once and you can conjugate *parler, habiter, travailler, aimer, chercher, regarder*…

| parler | |
|---|---|
| je | parl**e** |
| tu | parl**es** |
| il / elle | parl**e** |
| nous | parl**ons** |
| vous | parl**ez** |
| ils / elles | parl**ent** |

Good news for speaking: **parle, parles, parlent** are pronounced exactly the same. Only *nous* and *vous* sound different.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les verbes en -er : un seul modèle, des centaines de verbes', 'Environ 90 % des verbes français se terminent en **-er** et suivent un modèle unique. Apprenez-le une fois et vous conjuguez *parler, habiter, travailler, aimer, chercher, regarder*…

| parler | |
|---|---|
| je | parl**e** |
| tu | parl**es** |
| il / elle | parl**e** |
| nous | parl**ons** |
| vous | parl**ez** |
| ils / elles | parl**ent** |

Bonne nouvelle à l''oral : **parle, parles, parlent** se prononcent exactement de la même façon. Seuls *nous* et *vous* s''entendent différemment.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=sXM1FoMLqo4', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Prepositions with cities and countries', '| | where you are / are going | where you come from |
|---|---|---|
| city | **à** Paris | **de** Paris |
| feminine country (ends in -e) | **en** France, en Espagne | **de** France |
| masculine country | **au** Portugal, au Canada | **du** Portugal |
| plural country | **aux** États-Unis | **des** États-Unis |

Almost every country ending in **-e** is feminine — with one famous exception: **le Mexique**. So: *je vais au Mexique*, but *je vais en Colombie*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les prépositions avec les villes et les pays', '| | lieu où l''on est / où l''on va | lieu d''où l''on vient |
|---|---|---|
| ville | **à** Paris | **de** Paris |
| pays féminin (en -e) | **en** France, en Espagne | **de** France |
| pays masculin | **au** Portugal, au Canada | **du** Portugal |
| pays pluriel | **aux** États-Unis | **des** États-Unis |

Presque tous les pays terminés par **-e** sont féminins — avec une exception célèbre : **le Mexique**. On dit donc *je vais au Mexique*, mais *je vais en Colombie*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', 'https://www.youtube.com/watch?v=VniHVrRJ0-4', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Depuis, pendant, il y a, dans', 'These four words place an action in time, and they are not interchangeable:

- **depuis** — started in the past, still going on: *j''habite en France **depuis** deux ans* (and I still do).
- **pendant** — a finished duration: *j''ai travaillé **pendant** six mois*.
- **il y a** — how long ago: *je suis arrivé **il y a** trois mois*.
- **dans** — how far in the future: *je commence **dans** une semaine*.

*Depuis* with the present tense is the one that most often surprises English and Spanish speakers: French says *j''habite ici depuis deux ans*, not *j''ai habité*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Depuis, pendant, il y a, dans', 'Ces quatre mots situent une action dans le temps, et ils ne sont pas interchangeables :

- **depuis** — action commencée dans le passé et toujours en cours : *j''habite en France **depuis** deux ans* (et j''y habite encore).
- **pendant** — durée achevée : *j''ai travaillé **pendant** six mois*.
- **il y a** — il y a combien de temps : *je suis arrivé **il y a** trois mois*.
- **dans** — dans combien de temps : *je commence **dans** une semaine*.

*Depuis* accompagné du présent est ce qui surprend le plus les hispanophones et les anglophones : on dit *j''habite ici depuis deux ans*, et non *j''ai habité*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'habiter', 'a.bi.te', 'J''habite à Lyon depuis un an.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to live (somewhere)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir son logement quelque part', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'travailler', 'tʁa.va.je', 'Je travaille dans un restaurant.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to work', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'exercer une activité professionnelle', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'parler', 'paʁ.le', 'Je parle espagnol et un peu français.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to speak', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 's''exprimer par la parole', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'chercher', 'ʃɛʁ.ʃe', 'Je cherche un logement.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to look for', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'essayer de trouver', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'un quartier', 'kaʁ.tje', 'J''habite dans un quartier calme.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a neighbourhood', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'partie d''une ville', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'un logement', 'lɔʒ.mɑ̃', 'Le logement est cher dans cette ville.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'housing, accommodation', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'lieu où l''on habite', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'depuis', 'd(ə).pɥi', 'J''apprends le français depuis six mois.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'since, for (still ongoing)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à partir d''un moment passé, et encore maintenant', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un pays', 'pe.i', 'Mon pays d''origine est le Salvador.'
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a country', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'territoire d''une nation', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Nous ___ français. »', 'With nous, an -er verb takes -ons: nous parlons.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Nous ___ français. »', 'Avec nous, le verbe en -er prend la terminaison -ons : nous parlons.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'parlons', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'parlez', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'parlent', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'parle', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''habite ___ Portugal. »', 'Le Portugal is masculine, so à + le gives au Portugal.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''habite ___ Portugal. »', 'Le Portugal est masculin : à + le donne au Portugal.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'au', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'en', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'à', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'aux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Elle habite ___ Belgique. »', 'La Belgique is a feminine country, so the preposition is en.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Elle habite ___ Belgique. »', 'La Belgique est un pays féminin : la préposition est en.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'en', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'au', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'à', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'dans la', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''habite en France ___ deux ans. » (the action continues today)', 'depuis — the action started two years ago and is still true. Pendant would close the period.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''habite en France ___ deux ans. » (l''action continue aujourd''hui)', 'depuis — l''action a commencé il y a deux ans et dure encore. Pendant refermerait la période.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'depuis'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l05-present-et-habiter';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Je suis arrivé il y a trois mois » means the arrival is still happening.', 'False. Il y a points to a finished event in the past: the arrival took place three months ago.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Je suis arrivé il y a trois mois » signifie que l''arrivée est encore en cours.', 'Faux. Il y a situe un événement achevé dans le passé : l''arrivée a eu lieu il y a trois mois.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l05-present-et-habiter' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 6 : La famille et les adjectifs possessifs
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l06-la-famille', 6, 30, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Family and possessive adjectives', 'Say who belongs to your family — and why « mon » is used with a feminine word.', 'Can describe their family and immediate circle in simple terms.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'La famille et les adjectifs possessifs', 'Dire qui compose sa famille — et comprendre pourquoi on dit « mon » devant un mot féminin.', 'Peut décrire sa famille et son entourage proche en termes simples.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'VOCABULARY', 'https://www.youtube.com/watch?v=OdGl0SW088Q', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The family', 'le père · la mère · les parents · le fils · la fille · le frère · la sœur · le mari · la femme · le grand-père · la grand-mère · l''oncle · la tante · le cousin / la cousine · les enfants

Two traps worth noting:
- **la femme** means both *woman* and *wife*; **le mari** means only *husband*.
- **la fille** means both *girl* and *daughter*. Context decides.

On administrative forms you will also meet: *situation de famille*, *célibataire*, *marié(e)*, *divorcé(e)*, *personne à charge*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'La famille', 'le père · la mère · les parents · le fils · la fille · le frère · la sœur · le mari · la femme · le grand-père · la grand-mère · l''oncle · la tante · le cousin / la cousine · les enfants

Deux pièges à retenir :
- **la femme** désigne à la fois la femme et l''épouse ; **le mari** ne désigne que l''époux.
- **la fille** désigne à la fois la jeune fille et la fille de quelqu''un. Le contexte tranche.

Sur les formulaires administratifs, on rencontre aussi : *situation de famille*, *célibataire*, *marié(e)*, *divorcé(e)*, *personne à charge*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=-QLWXMXeiUs', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Possessive adjectives', '| owner | masculine | feminine | plural |
|---|---|---|---|
| je | mon frère | ma sœur | mes parents |
| tu | ton frère | ta sœur | tes parents |
| il / elle | son frère | sa sœur | ses parents |
| nous | notre frère | notre sœur | nos parents |
| vous | votre frère | votre sœur | vos parents |
| ils / elles | leur frère | leur sœur | leurs parents |

The key point, and the one that surprises Spanish and English speakers: the form agrees with the **thing owned**, not with the owner. *Son frère* can mean *his brother* or *her brother* — French does not say.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les adjectifs possessifs', '| possesseur | masculin | féminin | pluriel |
|---|---|---|---|
| je | mon frère | ma sœur | mes parents |
| tu | ton frère | ta sœur | tes parents |
| il / elle | son frère | sa sœur | ses parents |
| nous | notre frère | notre sœur | nos parents |
| vous | votre frère | votre sœur | vos parents |
| ils / elles | leur frère | leur sœur | leurs parents |

Le point essentiel : la forme s''accorde avec **l''objet possédé**, non avec le possesseur. *Son frère* peut désigner le frère de Paul comme celui de Marie — le français ne le précise pas.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Why « mon amie » and not « ma amie »', 'Before a feminine word beginning with a **vowel or a silent h**, French replaces *ma, ta, sa* with **mon, ton, son** — purely to avoid two vowels colliding.

- une amie → **mon** amie
- une école → **mon** école
- une histoire → **mon** histoire

The word stays feminine; only the sound changes. This is the same instinct behind *l''école* instead of *la école*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Pourquoi « mon amie » et non « ma amie »', 'Devant un mot féminin commençant par une **voyelle ou un h muet**, le français remplace *ma, ta, sa* par **mon, ton, son** — uniquement pour éviter la rencontre de deux voyelles.

- une amie → **mon** amie
- une école → **mon** école
- une histoire → **mon** histoire

Le mot reste féminin ; seul le son change. C''est le même réflexe que dans *l''école* au lieu de *la école*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'les parents', 'pa.ʁɑ̃', 'Mes parents habitent au Salvador.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'parents', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le père et la mère', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'un frère', 'fʁɛʁ', 'J''ai deux frères.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a brother', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'fils des mêmes parents', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'une sœur', 'sœʁ', 'Ma sœur travaille à Bruxelles.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a sister', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'fille des mêmes parents', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'un enfant', 'ɑ̃.fɑ̃', 'Nous avons un enfant de trois ans.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a child', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'personne jeune ; fils ou fille de quelqu''un', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'marié(e)', 'ma.ʁje', 'Je suis mariée depuis 2020.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'married', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'uni par le mariage', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'célibataire', 'se.li.ba.tɛʁ', 'Il est célibataire.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'single, unmarried', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui n''est pas marié', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'un ami / une amie', 'a.mi', 'Mon amie Sofia est colombienne.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a friend', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'personne avec qui on a une relation d''affection', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un voisin / une voisine', 'vwa.zɛ̃ / vwa.zin', 'Ma voisine m''aide avec les papiers.'
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a neighbour', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'personne qui habite à côté', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « ___ sœur s''appelle Lucía. »', 'Sœur is feminine and begins with a consonant, so: ma sœur.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « ___ sœur s''appelle Lucía. »', 'Sœur est féminin et commence par une consonne : ma sœur.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Ma', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Mon', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Mes', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « ___ amie habite à Genève. »', 'Amie is feminine but starts with a vowel, so ma becomes mon: mon amie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « ___ amie habite à Genève. »', 'Amie est féminin mais commence par une voyelle : ma devient mon — mon amie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Mon', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Ma', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Mes', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Son frère » tells you whether the owner is a man or a woman.', 'False. The possessive agrees with the thing owned. Son frère is both *his brother* and *her brother*.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Son frère » indique si le possesseur est un homme ou une femme.', 'Faux. Le possessif s''accorde avec l''objet possédé. Son frère désigne aussi bien le frère de Paul que celui de Marie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 3 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « ___ parents habitent au Maroc. » (they are my parents)', 'mes — the noun is plural, so the possessive is plural too, whatever its gender.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « ___ parents habitent au Maroc. » (ce sont mes parents)', 'mes — le nom est au pluriel, donc le possessif l''est aussi, quel que soit son genre.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'mes'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l06-la-famille';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'On a form, « situation de famille : célibataire » means:', 'Célibataire means unmarried. Marié(e), divorcé(e) and veuf / veuve are the other usual boxes.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Sur un formulaire, « situation de famille : célibataire » signifie :', 'Célibataire signifie non marié. Marié(e), divorcé(e) et veuf / veuve sont les autres cases habituelles.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Non marié(e)', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Sans enfants', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Sans emploi', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l06-la-famille' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 7 : Le verbe aller et le futur proche
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l07-aller-et-futur-proche', 7, 30, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Aller and the near future', 'One irregular verb opens the whole future: je vais partir.', 'Can say where they are going and talk about immediate plans.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Le verbe aller et le futur proche', 'Un seul verbe irrégulier ouvre tout le futur : je vais partir.', 'Peut dire où il ou elle va et parler de ses projets immédiats.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=QtO4nU7JaY8', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The verb aller', '| aller | |
|---|---|
| je | vais |
| tu | vas |
| il / elle | va |
| nous | allons |
| vous | allez |
| ils / elles | vont |

It is worth the effort: *aller* is used for movement, for the near future, and for how you feel — **Comment allez-vous ?** — *Je vais bien, merci.*

With places, remember the contractions: *je vais **au** marché*, *je vais **à la** mairie*, *je vais **aux** urgences*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le verbe aller', '| aller | |
|---|---|
| je | vais |
| tu | vas |
| il / elle | va |
| nous | allons |
| vous | allez |
| ils / elles | vont |

L''effort en vaut la peine : *aller* sert au déplacement, au futur proche et à l''état de santé — **Comment allez-vous ?** — *Je vais bien, merci.*

Avec les lieux, pensez aux contractions : *je vais **au** marché*, *je vais **à la** mairie*, *je vais **aux** urgences*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=eCD-g1pr2Uc', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The near future: aller + infinitive', 'To talk about what is about to happen, French needs no new tense — just *aller* followed by the infinitive:

- **Je vais chercher** mes papiers. — I''m going to collect my documents.
- **Nous allons déménager** en mars. — We''re going to move in March.
- **Il va pleuvoir.** — It''s going to rain.

In everyday speech, this construction largely replaces the simple future. You can hold a full conversation about the future with only *aller* and a list of infinitives — which is exactly why it comes at A1.

Negation wraps around the conjugated verb: *je **ne** vais **pas** travailler demain*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le futur proche : aller + infinitif', 'Pour parler de ce qui va se produire, le français n''a besoin d''aucun temps nouveau : *aller* suivi de l''infinitif suffit.

- **Je vais chercher** mes papiers.
- **Nous allons déménager** en mars.
- **Il va pleuvoir.**

À l''oral, cette construction remplace très largement le futur simple. On peut tenir une conversation entière sur l''avenir avec *aller* et une liste d''infinitifs — raison pour laquelle elle figure dès le niveau A1.

La négation encadre le verbe conjugué : *je **ne** vais **pas** travailler demain*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', 'https://www.youtube.com/watch?v=Vv5aaC0AW6s', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Holidays and time off', '*Les vacances* is always plural in French: *je pars en vacances*, never *une vacance*.

Useful for work and administration:
- **les congés payés** — paid leave
- **un jour férié** — a public holiday
- **le pont** — the extra day taken between a public holiday and the weekend
- **la fermeture annuelle** — the annual shutdown, common in August

In August, many French administrative offices and small businesses close for several weeks. Planning a *rendez-vous* then is often impossible — worth knowing before an urgent errand.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les vacances et les congés', '*Les vacances* s''emploie toujours au pluriel : *je pars en vacances*, jamais *une vacance*.

Utile au travail et dans les démarches :
- **les congés payés**
- **un jour férié**
- **le pont** — la journée prise entre un jour férié et le week-end
- **la fermeture annuelle** — fréquente au mois d''août

En août, de nombreux services administratifs et petits commerces ferment plusieurs semaines. Obtenir un rendez-vous à cette période est souvent impossible : mieux vaut le savoir avant une démarche urgente.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'aller', 'a.le', 'Je vais à la mairie ce matin.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to go', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'se déplacer vers un lieu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'les vacances', 'va.kɑ̃s', 'Nous partons en vacances en juillet.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'holidays, vacation', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'période de repos, toujours au pluriel', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'un jour férié', 'ʒuʁ.fe.ʁje', 'Le 14 juillet est un jour férié.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a public holiday', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'jour chômé fixé par la loi', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'demander', 'd(ə).mɑ̃.de', 'Je vais demander un rendez-vous.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to ask (for)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'solliciter quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'rentrer', 'ʁɑ̃.tʁe', 'Je rentre chez moi à 18 heures.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to go back home, to return', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'revenir chez soi', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'bientôt', 'bjɛ̃.to', 'Je vais bientôt commencer un stage.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'soon', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'dans peu de temps', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'un projet', 'pʁɔ.ʒɛ', 'J''ai un projet : passer le DELF.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a plan, a project', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ce que l''on a l''intention de faire', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'déménager', 'de.me.na.ʒe', 'Nous allons déménager en mars.'
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to move house', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'changer de logement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Ils ___ à Paris demain. »', 'With ils, aller gives vont — an irregular form worth memorising.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Ils ___ à Paris demain. »', 'Avec ils, aller donne vont — une forme irrégulière à mémoriser.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'vont', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'allent', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'vas', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'allons', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Put into the near future: « Je cherche un travail. » → « Je ___ ___ un travail. »', 'je vais chercher — aller conjugated, then the infinitive, unchanged.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Mettez au futur proche : « Je cherche un travail. » → « Je ___ ___ un travail. »', 'je vais chercher — aller conjugué, puis l''infinitif, qui ne change pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 2;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'vais chercher'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence is correct?', 'Only aller is conjugated; the second verb stays in the infinitive: nous allons partir.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase est correcte ?', 'Seul aller se conjugue ; le second verbe reste à l''infinitif : nous allons partir.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Nous allons partir à huit heures.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Nous allons partons à huit heures.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je vais ___ urgences. »', 'Les urgences is plural, so à + les becomes aux.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je vais ___ urgences. »', 'Les urgences est un pluriel : à + les devient aux.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'aux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'au', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'à la', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'à les', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l07-aller-et-futur-proche';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You can say « une vacance » to talk about a holiday.', 'False. In this sense the word is always plural: les vacances. « Une vacance » exists but means a vacant post.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'On peut dire « une vacance » pour parler de congés.', 'Faux. En ce sens, le mot est toujours au pluriel : les vacances. « Une vacance » existe, mais désigne un poste vacant.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l07-aller-et-futur-proche' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 8 : Les verbes du voyage
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l08-verbes-du-voyage', 8, 35, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Travel verbs', 'Partir, arriver, prendre, dormir, savoir, connaître — the verbs of a journey.', 'Can manage a simple journey: buy a ticket, understand a departure, book a room.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les verbes du voyage', 'Partir, arriver, prendre, dormir, savoir, connaître — les verbes du déplacement.', 'Peut gérer un déplacement simple : acheter un billet, comprendre un départ, réserver une chambre.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=U8iHVc1A5dI', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Partir, prendre, dormir', '| | partir | prendre | dormir |
|---|---|---|---|
| je | pars | prends | dors |
| tu | pars | prends | dors |
| il / elle | part | prend | dort |
| nous | partons | prenons | dormons |
| vous | partez | prenez | dormez |
| ils / elles | partent | prennent | dorment |

Notice the pattern: the singular forms drop the consonant you hear in the plural. *Il part* [paʁ] versus *ils partent* [paʁt] — the plural is how you hear the difference.

**prendre** is everywhere in travel: *prendre le train, prendre le bus, prendre un billet, prendre un café*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Partir, prendre, dormir', '| | partir | prendre | dormir |
|---|---|---|---|
| je | pars | prends | dors |
| tu | pars | prends | dors |
| il / elle | part | prend | dort |
| nous | partons | prenons | dormons |
| vous | partez | prenez | dormez |
| ils / elles | partent | prennent | dorment |

Observez le mécanisme : au singulier, la consonne que l''on entend au pluriel disparaît. *Il part* [paʁ] contre *ils partent* [paʁt] — c''est au pluriel que la différence s''entend.

**prendre** est omniprésent en voyage : *prendre le train, prendre le bus, prendre un billet, prendre un café*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=xBs5iTRNCR8', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Savoir or connaître?', 'English uses *to know* for both. French splits them:

**savoir** — a fact, or how to do something.
- *Je sais où est la gare.*
- *Je sais conduire.*

**connaître** — to be acquainted with a person, a place, a work.
- *Je connais Marie.*
- *Je connais bien ce quartier.*

A reliable test: if the next word is a person or a place, use **connaître**. If it is *que*, *où*, *quand*, *si*, or an infinitive, use **savoir**.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Savoir ou connaître ?', 'L''anglais et l''espagnol emploient parfois un seul verbe. Le français en distingue deux :

**savoir** — un fait, ou une capacité.
- *Je sais où est la gare.*
- *Je sais conduire.*

**connaître** — être familier d''une personne, d''un lieu, d''une œuvre.
- *Je connais Marie.*
- *Je connais bien ce quartier.*

Un test fiable : si le mot suivant est une personne ou un lieu, employez **connaître**. Si c''est *que*, *où*, *quand*, *si* ou un infinitif, employez **savoir**.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'At the station', 'Sentences you can reuse as they are:

- **Un billet pour Lille, s''il vous plaît.**
- **Aller simple ou aller-retour ?** — One way or return?
- **Le train part de quel quai ?** — Which platform does the train leave from?
- **Il y a une correspondance ?** — Is there a connection?
- **Le train a du retard.** — The train is delayed.

On signs: *départs* (departures), *arrivées* (arrivals), *quai* (platform), *voie* (track), *guichet* (ticket desk), *composter* (validate your ticket).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'À la gare', 'Des phrases réutilisables telles quelles :

- **Un billet pour Lille, s''il vous plaît.**
- **Aller simple ou aller-retour ?**
- **Le train part de quel quai ?**
- **Il y a une correspondance ?**
- **Le train a du retard.**

Sur les panneaux : *départs*, *arrivées*, *quai*, *voie*, *guichet*, *composter* (valider son billet).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'partir', 'paʁ.tiʁ', 'Le train part à 7 h 15.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to leave, to depart', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'quitter un lieu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'arriver', 'a.ʁi.ve', 'J''arrive à Bruxelles à midi.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to arrive', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'parvenir à destination', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'prendre', 'pʁɑ̃dʁ', 'Je prends le bus tous les matins.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to take', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'saisir ; emprunter un moyen de transport', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'un billet', 'bi.jɛ', 'J''ai acheté un billet aller-retour.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a ticket', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'titre de transport', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'une gare', 'ɡaʁ', 'La gare est loin d''ici ?'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a train station', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'lieu de départ et d''arrivée des trains', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'dormir', 'dɔʁ.miʁ', 'Je dors chez un ami cette nuit.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to sleep', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'se reposer en état de sommeil', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'savoir', 'sa.vwaʁ', 'Je sais où est l''arrêt de bus.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to know (a fact), to know how to', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir connaissance d''un fait ; être capable de', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'connaître', 'kɔ.nɛtʁ', 'Je connais bien ce quartier.'
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to know (a person, a place)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'être familier d''une personne ou d''un lieu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ___ Marie depuis dix ans. »', 'Marie is a person, so connaître: je connais Marie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ___ Marie depuis dix ans. »', 'Marie est une personne : on emploie connaître — je connais Marie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'connais', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'sais', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'connaît', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ___ où est la pharmacie. »', 'The clause starts with où, so savoir: je sais où est la pharmacie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ___ où est la pharmacie. »', 'La proposition commence par où : on emploie savoir — je sais où est la pharmacie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'sais', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'connais', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'sait', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'At the ticket desk, ask for a ticket to Lille (polite form).', 'un billet pour Lille, s''il vous plaît — the destination takes pour, and the polite ending is expected.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Au guichet, demandez un billet pour Lille (formule polie).', 'un billet pour Lille, s''il vous plaît — la destination se marque par pour, et la formule de politesse est attendue.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'un billet pour lille s''il vous plaît'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'un billet pour lille sil vous plait'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'un billet pour lille s''il vous plait'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Le train a du retard » means:', 'The train is late. In a station announcement, listen for the number of minutes that follows.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Le train a du retard » signifie :', 'Le train est en retard. Dans une annonce en gare, guettez le nombre de minutes qui suit.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Le train est en retard', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Le train est annulé', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Le train est complet', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l08-verbes-du-voyage';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Ils ___ le train de 8 heures. »', 'prendre with ils gives prennent, with a doubled n.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Ils ___ le train de 8 heures. »', 'prendre avec ils donne prennent, avec deux n.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'prennent', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'prendent', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'prend', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l08-verbes-du-voyage' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 9 : Le courrier, les papiers et demander son chemin
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l09-courrier-et-orientation', 9, 30, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Post, paperwork and asking the way', 'Écrire, lire, envoyer — and how to ask for directions and understand the answer.', 'Can handle simple written correspondence and ask for and follow simple directions.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Le courrier, les papiers et demander son chemin', 'Écrire, lire, envoyer — et comment demander son chemin et comprendre la réponse.', 'Peut gérer une correspondance écrite simple, demander son chemin et suivre des indications simples.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=YxCbsj1YJrw', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Écrire, lire, envoyer', '| | écrire | lire | envoyer |
|---|---|---|---|
| je | écris | lis | envoie |
| tu | écris | lis | envoies |
| il / elle | écrit | lit | envoie |
| nous | écrivons | lisons | envoyons |
| vous | écrivez | lisez | envoyez |
| ils / elles | écrivent | lisent | envoient |

A formal letter or email still follows a fixed shape in French:

> **Madame, Monsieur,**
> Je vous écris au sujet de …
> Je vous remercie par avance.
> **Cordialement,**
> Ana Ramos

*Cordialement* is the safe neutral ending. *Bien à vous* is slightly warmer; *Salut* is only for friends.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Écrire, lire, envoyer', '| | écrire | lire | envoyer |
|---|---|---|---|
| je | écris | lis | envoie |
| tu | écris | lis | envoies |
| il / elle | écrit | lit | envoie |
| nous | écrivons | lisons | envoyons |
| vous | écrivez | lisez | envoyez |
| ils / elles | écrivent | lisent | envoient |

Une lettre ou un courriel formel suit en français une forme fixe :

> **Madame, Monsieur,**
> Je vous écris au sujet de …
> Je vous remercie par avance.
> **Cordialement,**
> Ana Ramos

*Cordialement* est la formule neutre sans risque. *Bien à vous* est un peu plus chaleureux ; *Salut* est réservé aux amis.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Understanding official mail', 'Words that decide whether a letter matters:

- **une convocation** — a summons to an appointment; the date is binding
- **un justificatif** — a supporting document you must attach
- **un récépissé** — a receipt, often proof that a request is being processed
- **un délai** — the deadline
- **veuillez fournir …** — please provide …
- **sous huitaine** — within eight days
- **accusé de réception** — acknowledgement of receipt

When a letter says *veuillez fournir* followed by a list, treat it as an obligation with a deadline, not a suggestion.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Comprendre le courrier administratif', 'Les mots qui déterminent l''importance d''une lettre :

- **une convocation** — invitation à un rendez-vous ; la date engage
- **un justificatif** — document à joindre pour prouver quelque chose
- **un récépissé** — reçu, souvent preuve qu''une demande est en cours
- **un délai** — le temps imparti
- **veuillez fournir …** — formule d''obligation polie
- **sous huitaine** — dans un délai de huit jours
- **accusé de réception**

Quand une lettre indique *veuillez fournir* suivi d''une liste, il s''agit d''une obligation assortie d''un délai, non d''une suggestion.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', 'https://www.youtube.com/watch?v=OoFsERiWYsU', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Asking the way', '**Asking**
- *Excusez-moi, où est la gare, s''il vous plaît ?*
- *Je cherche la mairie.*
- *C''est loin d''ici ?*

**Understanding the answer**
- *Allez tout droit.* — Go straight on.
- *Tournez à droite / à gauche.* — Turn right / left.
- *Prenez la première rue à droite.*
- *C''est en face de / à côté de / derrière la poste.*
- *C''est à cinq minutes à pied.*

If the answer goes too fast, one sentence saves the situation: **Pouvez-vous parler plus lentement, s''il vous plaît ?**'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Demander son chemin', '**Demander**
- *Excusez-moi, où est la gare, s''il vous plaît ?*
- *Je cherche la mairie.*
- *C''est loin d''ici ?*

**Comprendre la réponse**
- *Allez tout droit.*
- *Tournez à droite / à gauche.*
- *Prenez la première rue à droite.*
- *C''est en face de / à côté de / derrière la poste.*
- *C''est à cinq minutes à pied.*

Si la réponse va trop vite, une phrase sauve la situation : **Pouvez-vous parler plus lentement, s''il vous plaît ?**'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'écrire', 'e.kʁiʁ', 'J''écris une lettre à la préfecture.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to write', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'tracer des mots ; rédiger', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'envoyer', 'ɑ̃.vwa.je', 'J''envoie les documents aujourd''hui.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to send', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'faire parvenir quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'une lettre', 'lɛtʁ', 'J''ai reçu une lettre recommandée.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a letter', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'message écrit envoyé par la poste', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'un justificatif', 'ʒys.ti.fi.ka.tif', 'Il faut un justificatif de domicile.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a supporting document', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'document qui prouve une situation', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'une convocation', 'kɔ̃.vɔ.ka.sjɔ̃', 'J''ai reçu une convocation pour le 12 mars.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a summons, an appointment notice', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'lettre qui fixe un rendez-vous obligatoire', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'tout droit', 'tu.dʁwa', 'Allez tout droit jusqu''au feu.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'straight ahead', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'sans tourner', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'à gauche / à droite', 'a.ɡoʃ / a.dʁwat', 'Tournez à gauche après la banque.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'left / right', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'côté gauche / côté droit', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'en face de', 'ɑ̃.fas.də', 'La poste est en face de la mairie.'
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'opposite, across from', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'de l''autre côté, vis-à-vis', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'A letter says « Veuillez fournir un justificatif de domicile sous huitaine. » What must you do?', 'Send proof of address within eight days. Sous huitaine is a deadline, and veuillez fournir is an obligation.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Une lettre indique « Veuillez fournir un justificatif de domicile sous huitaine. » Que devez-vous faire ?', 'Envoyer une preuve de domicile dans un délai de huit jours. Sous huitaine est un délai, et veuillez fournir exprime une obligation.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Envoyer une preuve de domicile dans les huit jours', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Attendre huit semaines', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Rien : c''est une simple information', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which ending suits an email to an administration?', 'Cordialement is the neutral, always-acceptable ending. Salut is reserved for friends.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle formule convient pour un courriel adressé à une administration ?', 'Cordialement est la formule neutre, toujours acceptable. Salut est réservé aux amis.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Cordialement,', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Salut !', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Bisous,', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Ask politely where the town hall is.', 'Excusez-moi, où est la mairie, s''il vous plaît ? — the opening excusez-moi and the closing s''il vous plaît both matter.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Demandez poliment où se trouve la mairie.', 'Excusez-moi, où est la mairie, s''il vous plaît ? — l''ouverture excusez-moi et la clôture s''il vous plaît comptent toutes les deux.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'excusez-moi où est la mairie s''il vous plaît'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'excusez moi ou est la mairie sil vous plait'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'où est la mairie s''il vous plaît'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« C''est en face de la poste » means the place is:', 'Opposite the post office, on the other side of the street. À côté de would mean next door.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« C''est en face de la poste » signifie que le lieu est :', 'En vis-à-vis de la poste, de l''autre côté de la rue. À côté de signifierait juste à côté.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'De l''autre côté de la rue', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Juste à côté', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Derrière', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u1-l09-courrier-et-orientation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Une convocation » is an invitation you may decline freely.', 'False. A convocation sets a binding appointment; missing it can stop the procedure. Ask to change the date in advance if needed.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Une convocation » est une invitation que l''on peut décliner librement.', 'Faux. Une convocation fixe un rendez-vous qui engage ; ne pas s''y rendre peut bloquer la procédure. En cas d''empêchement, demandez un report à l''avance.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l09-courrier-et-orientation' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 10 : L'argent, les magasins et les partitifs
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u1-l10-argent-et-achats', 10, 35, TRUE
FROM units WHERE slug = 'a1-unit-1';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Money, shops and partitive articles', 'Buy, pay, ask the price — and learn the little words du, de la, des.', 'Can make simple purchases, ask prices and talk about food and quantities.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'L''argent, les magasins et les partitifs', 'Acheter, payer, demander le prix — et maîtriser les petits mots du, de la, des.', 'Peut effectuer des achats simples, demander un prix et parler de nourriture et de quantités.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=i7zbk4ZUThU', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Acheter, vendre, choisir', 'Three verbs, three different groups — a useful summary of French conjugation:

| | acheter (-er) | vendre (-re) | choisir (-ir) |
|---|---|---|---|
| je | achète | vends | choisis |
| tu | achètes | vends | choisis |
| il / elle | achète | vend | choisit |
| nous | achetons | vendons | choisissons |
| vous | achetez | vendez | choisissez |
| ils / elles | achètent | vendent | choisissent |

*Acheter* adds an accent grave where the ending is silent — *j''achète* but *nous achetons*. This keeps the sound [ɛ] audible.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Acheter, vendre, choisir', 'Trois verbes, trois groupes différents — un bon résumé de la conjugaison française :

| | acheter (-er) | vendre (-re) | choisir (-ir) |
|---|---|---|---|
| je | achète | vends | choisis |
| tu | achètes | vends | choisis |
| il / elle | achète | vend | choisit |
| nous | achetons | vendons | choisissons |
| vous | achetez | vendez | choisissez |
| ils / elles | achètent | vendent | choisissent |

*Acheter* prend un accent grave là où la terminaison est muette — *j''achète* mais *nous achetons*. Cet accent maintient le son [ɛ] audible.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=CkpMTO-DUgw', 'VIDEO'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Partitive articles: du, de la, des', 'For an unspecified quantity — some bread, some water — French uses the partitive:

| | |
|---|---|
| masculine | **du** pain, **du** café |
| feminine | **de la** viande, **de la** salade |
| before a vowel | **de l''**eau, **de l''**huile |
| plural | **des** fruits, **des** œufs |

Two rules that catch everyone:

1. **After a negation, everything becomes *de***: *je mange du pain* → *je **ne** mange **pas de** pain*.
2. **After an expression of quantity, also *de***: *un kilo **de** tomates*, *beaucoup **de** travail*, *un litre **de** lait*.

Unlike English, the partitive can never be left out: *je bois de l''eau*, never *je bois eau*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les articles partitifs : du, de la, des', 'Pour une quantité indéterminée — du pain, de l''eau — le français emploie l''article partitif :

| | |
|---|---|
| masculin | **du** pain, **du** café |
| féminin | **de la** viande, **de la** salade |
| devant une voyelle | **de l''**eau, **de l''**huile |
| pluriel | **des** fruits, **des** œufs |

Deux règles qui piègent tout le monde :

1. **Après une négation, tout devient *de*** : *je mange du pain* → *je **ne** mange **pas de** pain*.
2. **Après une expression de quantité, également *de*** : *un kilo **de** tomates*, *beaucoup **de** travail*, *un litre **de** lait*.

Contrairement à l''anglais, le partitif ne peut jamais être omis : *je bois de l''eau*, jamais *je bois eau*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Shops and paying', '**Where to buy what** — la boulangerie (bread), la boucherie (meat), la pharmacie, le supermarché, le marché, la banque, la poste.

**At the till**
- *Ça fait combien ?* — How much is it?
- *C''est combien, le kilo ?*
- *Je peux payer par carte ?*
- *Vous avez la monnaie ?* — Do you have change?
- *Une facture, s''il vous plaît.*

Two practical notes: the decimal comma is used, so **3,50 €** is read *trois euros cinquante*; and many small shops set a minimum amount for card payment — look for the sign *carte acceptée à partir de …*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les magasins et le paiement', '**Où acheter quoi** — la boulangerie, la boucherie, la pharmacie, le supermarché, le marché, la banque, la poste.

**À la caisse**
- *Ça fait combien ?*
- *C''est combien, le kilo ?*
- *Je peux payer par carte ?*
- *Vous avez la monnaie ?*
- *Une facture, s''il vous plaît.*

Deux remarques pratiques : la virgule sert de séparateur décimal — **3,50 €** se lit *trois euros cinquante* ; et beaucoup de petits commerces fixent un montant minimum pour le paiement par carte, signalé par la mention *carte acceptée à partir de …*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'acheter', 'aʃ.te', 'J''achète du pain à la boulangerie.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to buy', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'obtenir en payant', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'payer', 'pe.je', 'Je peux payer par carte ?'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to pay', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'remettre de l''argent en échange', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'le prix', 'pʁi', 'Quel est le prix du billet ?'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the price', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ce que coûte une chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'cher / chère', 'ʃɛʁ', 'C''est trop cher pour moi.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'expensive', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'd''un prix élevé', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'la monnaie', 'mɔ.nɛ', 'Je n''ai pas la monnaie.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'change (coins)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'pièces rendues ou petites pièces', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'une boulangerie', 'bu.lɑ̃ʒ.ʁi', 'La boulangerie ouvre à 7 heures.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a bakery', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'magasin où l''on vend du pain', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'gratuit(e)', 'ɡʁa.tɥi', 'L''entrée du musée est gratuite le dimanche.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'free of charge', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui ne coûte rien', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'boire', 'bwaʁ', 'Je bois de l''eau, merci.'
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to drink', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avaler un liquide', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je bois ___ eau. »', 'Eau is feminine and begins with a vowel: de l''eau.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je bois ___ eau. »', 'Eau est féminin et commence par une voyelle : de l''eau.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'de l''', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'du', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'de la', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'des', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Put into the negative: « Je mange du pain. »', 'After a negation the partitive becomes simply de: je ne mange pas de pain.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Mettez à la forme négative : « Je mange du pain. »', 'Après une négation, le partitif devient simplement de : je ne mange pas de pain.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je ne mange pas de pain.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je ne mange pas du pain.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je ne mange pas le pain.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Un kilo ___ tomates, s''il vous plaît. »', 'de — after any expression of quantity (un kilo, beaucoup, un litre), French uses de alone.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Un kilo ___ tomates, s''il vous plaît. »', 'de — après toute expression de quantité (un kilo, beaucoup, un litre), le français emploie de seul.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'de'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'How do you read « 3,50 € » out loud?', 'trois euros cinquante. The comma is the decimal separator in French.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Comment lit-on « 3,50 € » à voix haute ?', 'trois euros cinquante. La virgule est le séparateur décimal en français.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'trois euros cinquante', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'trois cent cinquante euros', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'trois euros cinq', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u1-l10-argent-et-achats';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Where do you buy bread?', 'À la boulangerie. La boucherie sells meat, la pharmacie sells medicine.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Où achète-t-on du pain ?', 'À la boulangerie. La boucherie vend de la viande, la pharmacie des médicaments.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'À la boulangerie', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'À la boucherie', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'À la pharmacie', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u1-l10-argent-et-achats' AND e.position = 5;
