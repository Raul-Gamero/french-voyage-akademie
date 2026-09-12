-- ==================================================================
-- Contenu académique — niveau A1, unité 2
-- Unité 2 — La vie quotidienne et le passé récent
--
-- FICHIER GÉNÉRÉ. Ne pas modifier à la main : éditer
--   content/a1/unit-2.json
-- puis relancer  python tools/generate_seed.py
-- ==================================================================

-- Unité 2 : Unité 2 — La vie quotidienne et le passé récent
INSERT INTO units (level_id, slug, position, published)
SELECT id, 'a1-unit-2', 2, TRUE
FROM levels WHERE code = 'A1';

INSERT INTO unit_translations (unit_id, locale, title, description)
SELECT id, 'en', 'Unit 2 — Everyday life and the recent past', 'Talk about your day, your home and your town, say what you did yesterday, express what you can, want and must do.'
FROM units WHERE slug = 'a1-unit-2';
INSERT INTO unit_translations (unit_id, locale, title, description)
SELECT id, 'fr', 'Unité 2 — La vie quotidienne et le passé récent', 'Parler de sa journée, de son logement et de sa ville, dire ce que l''on a fait hier, exprimer ce que l''on peut, veut et doit faire.'
FROM units WHERE slug = 'a1-unit-2';

-- ------------------------------------------------------------------
-- Leçon 1 : Paris et le monde francophone
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l01-paris-et-la-francophonie', 1, 30, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Paris and the French-speaking world', 'French is not only spoken in France — and that changes how you learn it.', 'Can understand the main point of a short, simple spoken text on a familiar cultural topic.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Paris et le monde francophone', 'Le français ne se parle pas qu''en France — et cela change la façon de l''apprendre.', 'Peut comprendre l''essentiel d''un document oral court et simple sur un sujet culturel familier.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'A language spoken on five continents', 'French is an official language in around thirty countries. Beyond France, the largest communities of speakers are in **Democratic Republic of the Congo, Canada (Quebec), Belgium, Switzerland, Ivory Coast, Cameroon, Senegal, Morocco, Algeria, Tunisia, Luxembourg, Monaco, Haiti**.

This matters for a learner in two ways.

First, there is no single correct accent. A Senegalese, a Quebecois and a Marseillais do not sound alike, and none of them speaks worse French than the others.

Second, some vocabulary changes from one country to another:

| France | Belgium / Switzerland | Quebec |
|---|---|---|
| soixante-dix | septante | soixante-dix |
| quatre-vingt-dix | nonante | quatre-vingt-dix |
| le petit-déjeuner | le déjeuner | le déjeuner |
| faire du shopping | — | magasiner |

This course teaches standard French, understood everywhere.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Une langue parlée sur cinq continents', 'Le français est langue officielle dans une trentaine de pays. Hors de France, les communautés de locuteurs les plus nombreuses se trouvent en **République démocratique du Congo, au Canada (Québec), en Belgique, en Suisse, en Côte d''Ivoire, au Cameroun, au Sénégal, au Maroc, en Algérie, en Tunisie, au Luxembourg, à Monaco et en Haïti**.

Cela a deux conséquences pour l''apprenant.

D''abord, il n''existe pas un seul accent correct. Un Sénégalais, un Québécois et un Marseillais ne se ressemblent pas, et aucun ne parle un français inférieur à celui des autres.

Ensuite, certains mots changent d''un pays à l''autre :

| France | Belgique / Suisse | Québec |
|---|---|---|
| soixante-dix | septante | soixante-dix |
| quatre-vingt-dix | nonante | quatre-vingt-dix |
| le petit-déjeuner | le déjeuner | le déjeuner |
| faire du shopping | — | magasiner |

Ce cours enseigne le français standard, compris partout.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'MEDIA', 'https://www.youtube.com/watch?v=y0dPCvtJzEI', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Listening: a first authentic document', 'Method — this is how to use every listening document in the course:

1. **Watch once without stopping.** Do not try to understand everything. Note only what you recognise.
2. **Watch again with pauses**, writing down the words you catch.
3. **Watch a third time without stopping.** You will hear noticeably more than the first time.

Understanding 30 % of an authentic document at A1 is a normal, good result. The aim is not to translate; it is to get used to the rhythm of real speech.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Écoute : un premier document authentique', 'Méthode — voici comment exploiter chaque document sonore du cours :

1. **Regardez une première fois sans arrêter.** N''essayez pas de tout comprendre. Notez seulement ce que vous reconnaissez.
2. **Regardez une deuxième fois avec des pauses**, en notant les mots saisis.
3. **Regardez une troisième fois sans arrêter.** Vous entendrez nettement plus qu''au premier passage.

Comprendre 30 % d''un document authentique au niveau A1 est un résultat normal et satisfaisant. L''objectif n''est pas de traduire, mais de s''habituer au rythme de la parole réelle.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Talking about a city', '- **une ville / un village** — a town / a village
- **un monument** — a landmark
- **un musée** — a museum
- **une place** — a square
- **un pont** — a bridge
- **le centre-ville** — the town centre
- **les transports en commun** — public transport

Useful structures:
- *Il y a un musée près d''ici ?* — Is there a museum nearby?
- *C''est une ville très vivante.* — It''s a very lively city.
- *Je préfère les petites villes.* — I prefer small towns.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Parler d''une ville', '- **une ville / un village**
- **un monument**
- **un musée**
- **une place**
- **un pont**
- **le centre-ville**
- **les transports en commun**

Structures utiles :
- *Il y a un musée près d''ici ?*
- *C''est une ville très vivante.*
- *Je préfère les petites villes.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'francophone', 'fʁɑ̃.kɔ.fɔn', 'Le Sénégal est un pays francophone.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'French-speaking', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui parle français', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'une ville', 'vil', 'Bruxelles est une ville bilingue.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a city, a town', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'agglomération importante', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'un monument', 'mɔ.ny.mɑ̃', 'La tour Eiffel est un monument célèbre.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a monument, a landmark', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'construction remarquable', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'célèbre', 'se.lɛbʁ', 'Ce musée est célèbre dans le monde entier.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'famous', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'très connu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'un accent', 'ak.sɑ̃', 'Elle a un accent québécois.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an accent (way of speaking)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'manière de prononcer propre à une région', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'comprendre', 'kɔ̃.pʁɑ̃dʁ', 'Je comprends un peu, mais pas tout.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to understand', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'saisir le sens', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'le centre-ville', 'sɑ̃tʁ.vil', 'J''habite près du centre-ville.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the town centre', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'partie centrale d''une ville', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'les transports en commun', 'tʁɑ̃s.pɔʁ.ɑ̃.kɔ.mɛ̃', 'Les transports en commun sont gratuits le dimanche.'
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'public transport', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'bus, tram, métro, train urbain', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In Belgium, how do people usually say 70?', 'septante. It is perfectly correct French, simply not the usage of France.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'En Belgique, comment dit-on habituellement 70 ?', 'septante. C''est un français parfaitement correct, simplement ce n''est pas l''usage de France.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'septante', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'soixante-dix', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'septe-dix', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'There is only one correct French accent, the Parisian one.', 'False. French is official in about thirty countries; Dakar, Montreal and Marseille accents are all legitimate French.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Il n''existe qu''un seul accent français correct, celui de Paris.', 'Faux. Le français est officiel dans une trentaine de pays ; les accents de Dakar, de Montréal et de Marseille sont tous du français légitime.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 2 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'On first listening to an authentic document, what should you aim for?', 'Listen without stopping and pick up what you recognise. Understanding everything on the first pass is not the goal at A1.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'À la première écoute d''un document authentique, que faut-il viser ?', 'Écouter sans s''arrêter et relever ce que l''on reconnaît. Tout comprendre dès la première écoute n''est pas l''objectif au niveau A1.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Repérer ce que l''on reconnaît, sans s''arrêter', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Traduire chaque mot', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Écrire le texte complet', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Ask whether there is a museum nearby.', 'Il y a un musée près d''ici ? — « il y a » is the all-purpose way of saying there is / there are.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Demandez s''il y a un musée près d''ici.', 'Il y a un musée près d''ici ? — « il y a » est la formule passe-partout pour signaler une existence.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'il y a un musée près d''ici'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'il y a un musee pres d''ici'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'est-ce qu''il y a un musée près d''ici'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l01-paris-et-la-francophonie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which country is NOT French-speaking?', 'Portugal. Senegal, Belgium and Canada all have French as an official language.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel pays n''est pas francophone ?', 'Le Portugal. Le Sénégal, la Belgique et le Canada comptent le français parmi leurs langues officielles.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Le Portugal', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Le Sénégal', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'La Belgique', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'Le Canada', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l01-paris-et-la-francophonie' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 2 : Les verbes les plus utiles
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l02-verbes-les-plus-utiles', 2, 35, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'The verbs you will use most', 'Twenty verbs cover most of everyday conversation. Learn these before any others.', 'Can recognise and use the most frequent French verbs in the present tense.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les verbes les plus utiles', 'Vingt verbes couvrent l''essentiel de la conversation quotidienne. À apprendre avant tous les autres.', 'Peut reconnaître et employer au présent les verbes français les plus fréquents.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'VOCABULARY', 'https://www.youtube.com/watch?v=k2fHb8nYXIE', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The twenty essential verbs', '| verb | meaning | example |
|---|---|---|
| être | to be | je suis prêt |
| avoir | to have | j''ai un rendez-vous |
| aller | to go | je vais au travail |
| faire | to do, to make | je fais les courses |
| dire | to say | il dit non |
| pouvoir | can, to be able | je peux venir |
| vouloir | to want | je veux apprendre |
| devoir | must, to have to | je dois partir |
| savoir | to know (a fact) | je sais lire |
| prendre | to take | je prends le bus |
| venir | to come | il vient demain |
| voir | to see | je vois bien |
| donner | to give | donnez-moi le papier |
| parler | to speak | je parle un peu |
| mettre | to put | je mets mon manteau |
| trouver | to find | je trouve ça difficile |
| passer | to pass, to spend | je passe demain |
| demander | to ask | je demande de l''aide |
| comprendre | to understand | je ne comprends pas |
| attendre | to wait | j''attends le bus |

Learn them with a whole sentence attached, never as a bare list — the sentence is what you will actually reuse.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les vingt verbes essentiels', '| verbe | sens | exemple |
|---|---|---|
| être | état | je suis prêt |
| avoir | possession | j''ai un rendez-vous |
| aller | déplacement | je vais au travail |
| faire | action générale | je fais les courses |
| dire | parole | il dit non |
| pouvoir | capacité | je peux venir |
| vouloir | volonté | je veux apprendre |
| devoir | obligation | je dois partir |
| savoir | connaissance | je sais lire |
| prendre | saisir, emprunter | je prends le bus |
| venir | provenance | il vient demain |
| voir | vision | je vois bien |
| donner | transmettre | donnez-moi le papier |
| parler | s''exprimer | je parle un peu |
| mettre | placer | je mets mon manteau |
| trouver | découvrir, juger | je trouve ça difficile |
| passer | se déplacer, séjourner | je passe demain |
| demander | solliciter | je demande de l''aide |
| comprendre | saisir le sens | je ne comprends pas |
| attendre | patienter | j''attends le bus |

Apprenez-les avec une phrase entière, jamais en liste nue : c''est la phrase que vous réemploierez réellement.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The three groups of verbs', 'French verbs fall into three families, and knowing which one you are facing tells you the endings.

**1st group — infinitive in -er** (90 % of verbs): parler, aimer, habiter. Endings: -e, -es, -e, -ons, -ez, -ent.

**2nd group — infinitive in -ir, with -iss- in the plural**: finir, choisir, réussir. Endings: -is, -is, -it, -issons, -issez, -issent.

**3rd group — everything else**: être, avoir, aller, faire, prendre, venir… These are the irregular ones, and also the most frequent. There is no shortcut: they are learned one by one, which is precisely why the previous section lists them.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les trois groupes de verbes', 'Les verbes français se répartissent en trois familles, et savoir à laquelle on a affaire donne les terminaisons.

**1er groupe — infinitif en -er** (90 % des verbes) : parler, aimer, habiter. Terminaisons : -e, -es, -e, -ons, -ez, -ent.

**2e groupe — infinitif en -ir, avec -iss- au pluriel** : finir, choisir, réussir. Terminaisons : -is, -is, -it, -issons, -issez, -issent.

**3e groupe — tout le reste** : être, avoir, aller, faire, prendre, venir… Ce sont les irréguliers, et ce sont aussi les plus fréquents. Il n''y a pas de raccourci : on les apprend un par un, et c''est bien pour cela que la section précédente les énumère.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'SUMMARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'How to learn a verb efficiently', '1. **One verb, one sentence from your own life.** *Je travaille dans un restaurant* is worth more than a conjugation table you never use.
2. **Say it out loud.** Three of the six present-tense forms sound identical; only speaking teaches you that.
3. **Revise in short bursts.** Ten minutes a day beats two hours on Sunday — memory works on repetition, not duration.
4. **Accept the plateau.** For two or three weeks it will feel as if nothing is improving. That is the stage where most learners stop, and it is exactly the stage before it starts working.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Comment apprendre un verbe efficacement', '1. **Un verbe, une phrase tirée de votre propre vie.** *Je travaille dans un restaurant* vaut mieux qu''un tableau de conjugaison jamais réemployé.
2. **Prononcez à voix haute.** Trois des six formes du présent se prononcent de manière identique ; seule la parole le fait comprendre.
3. **Révisez par petites séances.** Dix minutes par jour valent mieux que deux heures le dimanche : la mémoire fonctionne par répétition, pas par durée.
4. **Acceptez le palier.** Pendant deux ou trois semaines, vous aurez l''impression de ne plus progresser. C''est l''étape où la plupart des apprenants abandonnent, et c''est précisément celle qui précède le déclic.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'faire', 'fɛʁ', 'Je fais les courses le samedi.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to do, to make', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'accomplir une action', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'dire', 'diʁ', 'Qu''est-ce que vous dites ?'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to say', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'exprimer par la parole', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'voir', 'vwaʁ', 'Je vois le bus qui arrive.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to see', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'percevoir par les yeux', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'attendre', 'a.tɑ̃dʁ', 'J''attends depuis vingt minutes.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to wait (for)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'rester jusqu''à ce que quelque chose arrive', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'trouver', 'tʁu.ve', 'Je ne trouve pas mes clés.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to find; to think (an opinion)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'découvrir ; estimer', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'venir', 'v(ə).niʁ', 'Il vient de Tunisie.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to come', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'se déplacer vers celui qui parle', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'finir', 'fi.niʁ', 'Je finis le travail à 17 heures.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to finish', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'mener à son terme', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'réussir', 'ʁe.y.siʁ', 'J''ai réussi mon examen.'
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to succeed, to pass', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'obtenir le résultat voulu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which verb belongs to the 2nd group?', 'finir — infinitive in -ir with -iss- in the plural: nous finissons.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel verbe appartient au 2e groupe ?', 'finir — infinitif en -ir avec -iss- au pluriel : nous finissons.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'finir', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'parler', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'venir', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'faire', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Nous ___ à huit heures. » (finir)', 'finissons — the 2nd group inserts -iss- before the plural endings.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Nous ___ à huit heures. » (finir)', 'finissons — le 2e groupe intercale -iss- devant les terminaisons du pluriel.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'finissons', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'finons', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'finissez', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ne ___ pas mes clés. » (trouver)', 'trouve — trouver is a regular -er verb, so je trouve.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ne ___ pas mes clés. » (trouver)', 'trouve — trouver est un verbe régulier en -er : je trouve.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 3;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'trouve'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'The most frequent French verbs are also the most irregular ones.', 'True. être, avoir, aller, faire, prendre are all 3rd group. Frequency protects irregularity in every language.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Les verbes français les plus fréquents sont aussi les plus irréguliers.', 'Vrai. être, avoir, aller, faire, prendre relèvent tous du 3e groupe. La fréquence protège l''irrégularité dans toutes les langues.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 4 AND o.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l02-verbes-les-plus-utiles';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which learning habit works best?', 'Ten minutes a day. Memory consolidates through spaced repetition, not through long single sessions.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle habitude d''apprentissage est la plus efficace ?', 'Dix minutes par jour. La mémoire se consolide par la répétition espacée, non par de longues séances isolées.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Dix minutes par jour', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Deux heures une fois par semaine', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Tout réviser la veille de l''examen', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l02-verbes-les-plus-utiles' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 3 : Le passé composé
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l03-passe-compose', 3, 40, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'The passé composé', 'Talk about yesterday: the tense that carries almost all spoken narration.', 'Can describe past activities and personal experiences in simple sentences.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Le passé composé', 'Parler d''hier : le temps qui porte presque tout le récit oral.', 'Peut décrire des activités passées et des expériences personnelles en phrases simples.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=fWCUSTd6zOk', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'How it is built', '**auxiliary (avoir or être) in the present + past participle**

- *J''**ai mangé** une pomme.*
- *Nous **avons travaillé** hier.*
- *Elle **est partie** ce matin.*

Forming the participle:

| group | infinitive | participle |
|---|---|---|
| -er | parler | parl**é** |
| -ir (2nd) | finir | fin**i** |
| irregular | prendre, faire, voir, être, avoir | pris, fait, vu, été, eu |

Negation encloses the auxiliary only: *je **n''**ai **pas** compris*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Comment il se construit', '**auxiliaire (avoir ou être) au présent + participe passé**

- *J''**ai mangé** une pomme.*
- *Nous **avons travaillé** hier.*
- *Elle **est partie** ce matin.*

Formation du participe :

| groupe | infinitif | participe |
|---|---|---|
| -er | parler | parl**é** |
| -ir (2e) | finir | fin**i** |
| irréguliers | prendre, faire, voir, être, avoir | pris, fait, vu, été, eu |

La négation encadre le seul auxiliaire : *je **n''**ai **pas** compris*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=dH82lWRAOpQ', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Avoir or être?', '**Avoir** is the default: it works for the vast majority of verbs.

**Être** is used for two cases only.

**1. A short list of movement and change-of-state verbs** — often remembered as *la maison d''être*:
aller, venir, arriver, partir, entrer, sortir, monter, descendre, rester, tomber, naître, mourir, passer, retourner, revenir, devenir.

**2. All reflexive verbs**: se lever, se laver, s''appeler, se souvenir.
- *Je **me suis** levé à six heures.*

With **être**, the participle agrees with the subject:
- *Il est part**i***. / *Elle est part**ie***. / *Ils sont part**is***. / *Elles sont part**ies***.

With **avoir**, no agreement with the subject: *elle a mangé*, not *elle a mangée*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Avoir ou être ?', '**Avoir** est le cas par défaut : il vaut pour la très grande majorité des verbes.

**Être** ne s''emploie que dans deux cas.

**1. Une courte liste de verbes de mouvement et de changement d''état** — que l''on retient souvent sous le nom de *maison d''être* :
aller, venir, arriver, partir, entrer, sortir, monter, descendre, rester, tomber, naître, mourir, passer, retourner, revenir, devenir.

**2. Tous les verbes pronominaux** : se lever, se laver, s''appeler, se souvenir.
- *Je **me suis** levé à six heures.*

Avec **être**, le participe s''accorde avec le sujet :
- *Il est part**i***. / *Elle est part**ie***. / *Ils sont part**is***. / *Elles sont part**ies***.

Avec **avoir**, pas d''accord avec le sujet : *elle a mangé*, et non *elle a mangée*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', 'https://www.youtube.com/watch?v=mH0tYv3T2-g', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Reflexive verbs in the past', 'The pronoun stays in front of the auxiliary, and the auxiliary is always **être**:

| | se lever |
|---|---|
| je | me suis levé(e) |
| tu | t''es levé(e) |
| il / elle | s''est levé(e) |
| nous | nous sommes levé(e)s |
| vous | vous êtes levé(e)s |
| ils / elles | se sont levé(e)s |

Negation: *je **ne** me suis **pas** levé tôt.*

A daily-life sentence worth memorising whole: *Ce matin, je me suis levé à six heures, je me suis douché et je suis parti au travail.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les verbes pronominaux au passé', 'Le pronom reste devant l''auxiliaire, et l''auxiliaire est toujours **être** :

| | se lever |
|---|---|
| je | me suis levé(e) |
| tu | t''es levé(e) |
| il / elle | s''est levé(e) |
| nous | nous sommes levé(e)s |
| vous | vous êtes levé(e)s |
| ils / elles | se sont levé(e)s |

Négation : *je **ne** me suis **pas** levé tôt.*

Une phrase du quotidien à mémoriser telle quelle : *Ce matin, je me suis levé à six heures, je me suis douché et je suis parti au travail.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'hier', 'jɛʁ', 'Hier, j''ai travaillé jusqu''à 20 heures.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'yesterday', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le jour précédent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'déjà', 'de.ʒa', 'J''ai déjà envoyé les documents.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'already', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avant le moment présent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'ce matin', 'sə.ma.tɛ̃', 'Ce matin, je me suis levé à six heures.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'this morning', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'la matinée du jour où l''on parle', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'se lever', 'sə.l(ə).ve', 'Je me lève à six heures tous les jours.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to get up', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'quitter son lit ; se mettre debout', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'naître', 'nɛtʁ', 'Je suis né au Salvador.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to be born', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'venir au monde', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'rester', 'ʁɛs.te', 'Je suis resté à la maison dimanche.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to stay', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'demeurer dans un lieu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'tomber', 'tɔ̃.be', 'Elle est tombée dans l''escalier.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to fall', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'chuter', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'oublier', 'u.bli.je', 'J''ai oublié mon rendez-vous.'
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to forget', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ne plus se souvenir', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Hier, j''___ travaillé. »', 'ai — travailler takes avoir, like the vast majority of verbs.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Hier, j''___ travaillé. »', 'ai — travailler se conjugue avec avoir, comme la très grande majorité des verbes.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'ai', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'suis', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'es', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Elle ___ partie à midi. »', 'est — partir is a movement verb from the maison d''être, and the participle agrees: partie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Elle ___ partie à midi. »', 'est — partir appartient à la maison d''être, et le participe s''accorde : partie.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'est', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'a', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'ont', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence is correct?', 'Je me suis levé tôt. Reflexive verbs always take être, and the pronoun stays before the auxiliary.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase est correcte ?', 'Je me suis levé tôt. Les verbes pronominaux prennent toujours être, et le pronom reste devant l''auxiliaire.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je me suis levé tôt.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'J''ai me levé tôt.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je m''ai levé tôt.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Put into the passé composé: « Je prends le bus. » → « J''___ ___ le bus. »', 'ai pris — prendre has an irregular participle, pris, and takes avoir.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Mettez au passé composé : « Je prends le bus. » → « J''___ ___ le bus. »', 'ai pris — prendre a un participe irrégulier, pris, et se conjugue avec avoir.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'ai pris'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l03-passe-compose';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In « elle a mangé », the participle should agree and be written « mangée ».', 'False. With avoir there is no agreement with the subject. Agreement with the subject happens only with être.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dans « elle a mangé », le participe devrait s''accorder et s''écrire « mangée ».', 'Faux. Avec avoir, il n''y a pas d''accord avec le sujet. L''accord avec le sujet ne se produit qu''avec être.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l03-passe-compose' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 4 : La vie quotidienne, la maison et la ville
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l04-vie-quotidienne', 4, 35, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Daily life, home and town', 'Describe an ordinary day and the place where you live.', 'Can describe their daily routine and their living environment in simple terms.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'La vie quotidienne, la maison et la ville', 'Décrire une journée ordinaire et le lieu où l''on vit.', 'Peut décrire sa routine quotidienne et son cadre de vie en termes simples.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=zC4_VxBhTyQ', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Reflexive verbs and the daily routine', 'A day in French runs mostly on reflexive verbs — the action comes back onto the subject:

se réveiller · se lever · se laver · se doucher · s''habiller · se préparer · se dépêcher · se reposer · se coucher · s''endormir

| | se lever |
|---|---|
| je | **me** lève |
| tu | **te** lèves |
| il / elle | **se** lève |
| nous | **nous** levons |
| vous | **vous** levez |
| ils / elles | **se** lèvent |

Compare: *je lave la voiture* (I wash the car) versus *je me lave* (I wash myself). The pronoun is what changes the meaning.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les verbes pronominaux et la routine', 'Une journée en français repose largement sur les verbes pronominaux — l''action retombe sur le sujet :

se réveiller · se lever · se laver · se doucher · s''habiller · se préparer · se dépêcher · se reposer · se coucher · s''endormir

| | se lever |
|---|---|
| je | **me** lève |
| tu | **te** lèves |
| il / elle | **se** lève |
| nous | **nous** levons |
| vous | **vous** levez |
| ils / elles | **se** lèvent |

Comparez : *je lave la voiture* et *je me lave*. C''est le pronom qui change le sens.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', 'https://www.youtube.com/watch?v=4V2srYL1VC0', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The home', '**Rooms** — la cuisine, la salle de bains, les toilettes, la chambre, le salon, l''entrée, le balcon.

**Furniture** — une table, une chaise, un lit, une armoire, un canapé, une fenêtre, une porte.

**Housing vocabulary you will meet when renting** — un studio, un appartement, une maison, un loyer (rent), des charges (service charges), une caution (deposit), un bail (lease), un état des lieux (inventory of fixtures), un propriétaire (landlord), un locataire (tenant).

A sentence worth having ready: *Je cherche un studio à moins de 600 euros, charges comprises.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'La maison', '**Les pièces** — la cuisine, la salle de bains, les toilettes, la chambre, le salon, l''entrée, le balcon.

**Les meubles** — une table, une chaise, un lit, une armoire, un canapé, une fenêtre, une porte.

**Le vocabulaire du logement, que l''on rencontre en louant** — un studio, un appartement, une maison, un loyer, des charges, une caution, un bail, un état des lieux, un propriétaire, un locataire.

Une phrase à garder prête : *Je cherche un studio à moins de 600 euros, charges comprises.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', 'https://www.youtube.com/watch?v=jh_EH9OS3_k', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The town and its services', 'la mairie · la poste · la banque · l''école · l''hôpital · la pharmacie · le commissariat · la préfecture · la bibliothèque · l''arrêt de bus · la station de métro

Three of these matter more than the rest when you arrive somewhere new:

- **la mairie** — registration, certificates, school enrolment, many free local services
- **la préfecture** — residence permits and official status
- **la bibliothèque** — free, warm, open to everyone, usually with free internet and often free French conversation groups

The library is the most underused resource on this list.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'La ville et ses services', 'la mairie · la poste · la banque · l''école · l''hôpital · la pharmacie · le commissariat · la préfecture · la bibliothèque · l''arrêt de bus · la station de métro

Trois de ces lieux comptent plus que les autres à l''arrivée dans une ville :

- **la mairie** — inscriptions, attestations, scolarisation, nombreux services locaux gratuits
- **la préfecture** — titres de séjour et situation administrative
- **la bibliothèque** — gratuite, chauffée, ouverte à tous, généralement avec internet libre et souvent des ateliers de conversation en français

La bibliothèque est la ressource la plus sous-utilisée de cette liste.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'se réveiller', 'sə.ʁe.ve.je', 'Je me réveille à 6 heures.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to wake up', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'cesser de dormir', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 's''habiller', 'sa.bi.je', 'Il s''habille très vite.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to get dressed', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'mettre ses vêtements', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'se coucher', 'sə.ku.ʃe', 'Je me couche vers 23 heures.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to go to bed', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'aller dormir', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'la cuisine', 'kɥi.zin', 'La cuisine est petite mais claire.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the kitchen; cooking', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'pièce où l''on prépare les repas', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'une chambre', 'ʃɑ̃bʁ', 'L''appartement a deux chambres.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a bedroom', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'pièce où l''on dort', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'le loyer', 'lwa.je', 'Le loyer est de 550 euros par mois.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the rent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'somme payée chaque mois pour un logement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'la mairie', 'mɛ.ʁi', 'Il faut aller à la mairie pour ce document.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the town hall', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'administration de la commune', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'la bibliothèque', 'bi.bli.jɔ.tɛk', 'La bibliothèque est gratuite et ouverte à tous.'
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the library', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'lieu public où l''on emprunte des livres', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ___ lève à six heures. »', 'me — the reflexive pronoun for je is me, and it goes before the verb.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ___ lève à six heures. »', 'me — le pronom réfléchi de je est me, et il se place devant le verbe.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'me', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'se', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'te', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'mon', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence means « I wash the car »?', 'Je lave la voiture — without the pronoun. Je me lave means I wash myself.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase signifie « je lave la voiture » ?', 'Je lave la voiture — sans pronom. Je me lave signifie que l''on se lave soi-même.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je lave la voiture.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je me lave la voiture.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je se lave la voiture.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Where do you go to enrol a child in school?', 'À la mairie. The préfecture handles residence status, not school enrolment.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Où s''adresse-t-on pour inscrire un enfant à l''école ?', 'À la mairie. La préfecture traite le séjour, non les inscriptions scolaires.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'À la mairie', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'À la préfecture', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'À la poste', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Le ___ est de 550 euros par mois. » (the monthly sum paid for housing)', 'loyer. La caution is the one-off deposit; les charges are the service charges on top.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Le ___ est de 550 euros par mois. » (la somme versée chaque mois pour le logement)', 'loyer. La caution est le dépôt versé une seule fois ; les charges s''ajoutent au loyer.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'loyer'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l04-vie-quotidienne';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You need to pay to enter a public library in France.', 'False. Entry and on-site reading are free for everyone. Only a borrowing card may sometimes cost a small annual fee.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Il faut payer pour entrer dans une bibliothèque publique en France.', 'Faux. L''entrée et la consultation sur place sont gratuites pour tous. Seule la carte d''emprunt peut parfois coûter une petite somme annuelle.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l04-vie-quotidienne' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 5 : Les verbes de l'action quotidienne
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l05-verbes-du-quotidien', 5, 30, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Everyday action verbs', 'Écouter, regarder, commencer, finir, parler — and the prepositions that follow them.', 'Can say what they are doing, starting and finishing in everyday contexts.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les verbes de l''action quotidienne', 'Écouter, regarder, commencer, finir, parler — et les prépositions qui les suivent.', 'Peut dire ce qu''il ou elle fait, commence et termine dans des contextes quotidiens.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=pc7fnFdWNkk', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Five verbs, three patterns', '| | écouter | regarder | commencer | finir | parler |
|---|---|---|---|---|---|
| je | écoute | regarde | commence | finis | parle |
| tu | écoutes | regardes | commences | finis | parles |
| il / elle | écoute | regarde | commence | finit | parle |
| nous | écoutons | regardons | commen**ç**ons | finissons | parlons |
| vous | écoutez | regardez | commencez | finissez | parlez |
| ils / elles | écoutent | regardent | commencent | finissent | parlent |

Note the cedilla in **nous commençons**: without it, the c before o would be pronounced [k]. The same happens with *nous mangeons*, where the e keeps the soft [ʒ] sound.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Cinq verbes, trois modèles', '| | écouter | regarder | commencer | finir | parler |
|---|---|---|---|---|---|
| je | écoute | regarde | commence | finis | parle |
| tu | écoutes | regardes | commences | finis | parles |
| il / elle | écoute | regarde | commence | finit | parle |
| nous | écoutons | regardons | commen**ç**ons | finissons | parlons |
| vous | écoutez | regardez | commencez | finissez | parlez |
| ils / elles | écoutent | regardent | commencent | finissent | parlent |

Notez la cédille de **nous commençons** : sans elle, le c devant o se prononcerait [k]. Même logique dans *nous mangeons*, où le e conserve le son doux [ʒ].'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The preposition is part of the verb', 'Some French verbs need no preposition where English uses one — and the reverse:

| French | English |
|---|---|
| écouter **∅** la radio | to listen **to** the radio |
| regarder **∅** un film | to look **at** a film |
| attendre **∅** le bus | to wait **for** the bus |
| chercher **∅** un travail | to look **for** a job |
| téléphoner **à** quelqu''un | to phone somebody |
| répondre **à** une question | to answer a question |
| parler **à** quelqu''un **de** quelque chose | to talk to somebody about something |

Learn the verb and its preposition as one block. *J''attends le bus*, never *j''attends pour le bus*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'La préposition fait partie du verbe', 'Certains verbes français se passent de préposition là où l''anglais en emploie une — et inversement :

| français | anglais |
|---|---|
| écouter **∅** la radio | to listen **to** the radio |
| regarder **∅** un film | to look **at** a film |
| attendre **∅** le bus | to wait **for** the bus |
| chercher **∅** un travail | to look **for** a job |
| téléphoner **à** quelqu''un | to phone somebody |
| répondre **à** une question | to answer a question |
| parler **à** quelqu''un **de** quelque chose | to talk to somebody about something |

Apprenez le verbe et sa préposition comme un bloc. *J''attends le bus*, jamais *j''attends pour le bus*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Starting and finishing', '- **commencer à + infinitive** — *je commence à comprendre*
- **finir de + infinitive** — *j''ai fini de travailler*
- **continuer à / de + infinitive** — *je continue à apprendre*
- **arrêter de + infinitive** — *j''ai arrêté de fumer*
- **venir de + infinitive** — the very recent past: *je viens d''arriver* (I have just arrived)

That last one is worth noticing: **venir de** + infinitive is how French says *to have just done something*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Commencer et finir', '- **commencer à + infinitif** — *je commence à comprendre*
- **finir de + infinitif** — *j''ai fini de travailler*
- **continuer à / de + infinitif** — *je continue à apprendre*
- **arrêter de + infinitif** — *j''ai arrêté de fumer*
- **venir de + infinitif** — le passé tout récent : *je viens d''arriver*

Cette dernière structure mérite l''attention : **venir de** + infinitif exprime une action qui vient tout juste de se produire.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'écouter', 'e.ku.te', 'J''écoute la radio en français tous les matins.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to listen to', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'prêter attention à un son', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'regarder', 'ʁ(ə).ɡaʁ.de', 'Nous regardons un film ce soir.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to watch, to look at', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'porter le regard sur quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'commencer', 'kɔ.mɑ̃.se', 'Le cours commence à neuf heures.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to begin', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'entamer une action', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'répondre', 'ʁe.pɔ̃dʁ', 'Je réponds toujours aux courriels.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to answer', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'donner une réponse', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'téléphoner', 'te.le.fɔ.ne', 'Je téléphone à ma mère le dimanche.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to phone', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'appeler par téléphone', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'arrêter', 'a.ʁe.te', 'J''ai arrêté de fumer en janvier.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to stop', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'cesser une action', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'venir de', 'v(ə).niʁ.də', 'Je viens d''arriver en France.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to have just (done something)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'exprimer un passé très récent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'tous les jours', 'tu.le.ʒuʁ', 'J''étudie le français tous les jours.'
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'every day', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'chaque jour', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence is correct?', 'J''écoute la radio — écouter takes a direct object, with no preposition.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase est correcte ?', 'J''écoute la radio — écouter se construit avec un complément direct, sans préposition.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'J''écoute la radio.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'J''écoute à la radio.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'J''écoute de la radio.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je téléphone ___ ma sœur. »', 'à — téléphoner always takes à before the person called.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je téléphone ___ ma sœur. »', 'à — téléphoner se construit toujours avec à devant la personne appelée.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'à', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, '∅ (rien)', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'de', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'pour', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Nous ___ le cours à neuf heures. » (commencer)', 'commençons, with a cedilla — otherwise the c before o would be read [k].'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Nous ___ le cours à neuf heures. » (commencer)', 'commençons, avec une cédille — sans elle, le c devant o se lirait [k].'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'commençons', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'commencons', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'commencez', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Say that you have just arrived in France (use venir de).', 'je viens d''arriver en France — venir de + infinitive expresses a very recent past.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dites que vous venez tout juste d''arriver en France (employez venir de).', 'je viens d''arriver en France — venir de + infinitif exprime un passé tout récent.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je viens d''arriver en france'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je viens darriver en france'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l05-verbes-du-quotidien';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« J''attends pour le bus » is correct French.', 'False. Attendre takes a direct object: j''attends le bus. The preposition is an English interference.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« J''attends pour le bus » est du français correct.', 'Faux. Attendre se construit sans préposition : j''attends le bus. La préposition est un calque de l''anglais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l05-verbes-du-quotidien' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 6 : Étudier, donner, aimer
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l06-verbes-relation', 6, 30, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Studying, giving, liking', 'The verbs of study and relationships — and how to express taste.', 'Can express likes and dislikes and talk about study and everyday exchanges.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Étudier, donner, aimer', 'Les verbes de l''étude et de la relation — et comment exprimer ses goûts.', 'Peut exprimer ses goûts et parler de ses études et de ses échanges quotidiens.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=rlhD7ARg9Ro', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Mettre and s''asseoir', '| | mettre | s''asseoir |
|---|---|---|
| je | mets | m''assieds |
| tu | mets | t''assieds |
| il / elle | met | s''assied |
| nous | mettons | nous asseyons |
| vous | mettez | vous asseyez |
| ils / elles | mettent | s''asseyent |

**mettre** is far wider than *to put*: *mettre un manteau* (to put on a coat), *mettre la table* (to lay the table), *mettre une heure* (to take an hour).

You will mostly meet *s''asseoir* as a polite invitation: **Asseyez-vous, je vous en prie.**'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Mettre et s''asseoir', '| | mettre | s''asseoir |
|---|---|---|
| je | mets | m''assieds |
| tu | mets | t''assieds |
| il / elle | met | s''assied |
| nous | mettons | nous asseyons |
| vous | mettez | vous asseyez |
| ils / elles | mettent | s''asseyent |

**mettre** est bien plus large que « placer » : *mettre un manteau*, *mettre la table*, *mettre une heure* (pour dire une durée).

On rencontre surtout *s''asseoir* dans une invitation polie : **Asseyez-vous, je vous en prie.**'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=hEO30adZxHw', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Expressing taste: aimer and its family', 'From strongest to weakest:

- **j''adore** — I love it
- **j''aime beaucoup** — I like it a lot
- **j''aime bien** — I quite like it
- **je n''aime pas** — I don''t like it
- **je déteste** — I hate it

Two structures:
- **aimer + noun**: *j''aime le café* — note the definite article, where English has none.
- **aimer + infinitive**: *j''aime lire*, *je déteste attendre*.

A cultural note: **j''aime bien** is weaker than **j''aime**. Saying *je t''aime bien* to someone is friendly; *je t''aime* is a declaration of love. The little *bien* changes everything.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Exprimer ses goûts : aimer et sa famille', 'Du plus fort au plus faible :

- **j''adore**
- **j''aime beaucoup**
- **j''aime bien**
- **je n''aime pas**
- **je déteste**

Deux constructions :
- **aimer + nom** : *j''aime le café* — avec l''article défini, là où l''anglais n''en met pas.
- **aimer + infinitif** : *j''aime lire*, *je déteste attendre*.

Une remarque culturelle : **j''aime bien** est plus faible que **j''aime**. Dire *je t''aime bien* à quelqu''un est amical ; *je t''aime* est une déclaration d''amour. Le petit *bien* change tout.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', 'https://www.youtube.com/watch?v=crBo-vd5CZQ', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Studying', 'étudier · apprendre · enseigner · un cours · une leçon · un exercice · un examen · une note · un diplôme · une formation · un stage

Useful in France and Belgium:
- **une formation** — a training course, often free and state-funded for job seekers
- **un stage** — an internship or short practical course
- **la validation des acquis** — recognition of prior learning, a route to certify skills you already have without redoing a full degree

If you hold a qualification from your country of origin, ask about **la reconnaissance des diplômes** at the local ENIC-NARIC centre. It is a slow procedure, but it changes which jobs you can apply for.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Étudier', 'étudier · apprendre · enseigner · un cours · une leçon · un exercice · un examen · une note · un diplôme · une formation · un stage

Utile en France et en Belgique :
- **une formation** — souvent gratuite et financée par l''État pour les demandeurs d''emploi
- **un stage** — période pratique en entreprise
- **la validation des acquis** — reconnaissance de compétences déjà maîtrisées, sans refaire un cursus complet

Si vous détenez un diplôme obtenu dans votre pays d''origine, renseignez-vous sur **la reconnaissance des diplômes** auprès du centre ENIC-NARIC. La procédure est lente, mais elle change la nature des emplois auxquels on peut postuler.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'étudier', 'e.ty.dje', 'J''étudie le français depuis six mois.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to study', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'apprendre par le travail intellectuel', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'apprendre', 'a.pʁɑ̃dʁ', 'J''apprends vite quand je pratique.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to learn', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'acquérir une connaissance', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'donner', 'dɔ.ne', 'Donnez-moi votre numéro, s''il vous plaît.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to give', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'remettre quelque chose à quelqu''un', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'mettre', 'mɛtʁ', 'Je mets mon manteau, il fait froid.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to put, to put on', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'placer ; enfiler un vêtement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'aimer', 'e.me', 'J''aime beaucoup la cuisine française.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to like, to love', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'éprouver de l''attirance ou de l''affection', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'détester', 'de.tɛs.te', 'Je déteste attendre au téléphone.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to hate', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir en aversion', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'une formation', 'fɔʁ.ma.sjɔ̃', 'J''ai trouvé une formation gratuite en informatique.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a training course', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'enseignement professionnel court', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un diplôme', 'di.plom', 'Mon diplôme n''est pas encore reconnu ici.'
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a diploma, a degree', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'titre délivré après des études', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''aime ___ café. »', 'le café — with aimer, French uses the definite article to speak about something in general.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''aime ___ café. »', 'le café — avec aimer, le français emploie l''article défini pour parler d''une chose en général.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'le', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'du', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'de', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'un', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which is the strongest expression?', 'J''adore. Then j''aime beaucoup, then j''aime bien — which is in fact the mildest of the three.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle expression est la plus forte ?', 'J''adore. Viennent ensuite j''aime beaucoup, puis j''aime bien — qui est en réalité la plus faible des trois.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'J''adore', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'J''aime bien', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'J''aime beaucoup', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Il ___ son manteau. » (mettre)', 'met — the third person singular of mettre has no ending after the t of the stem.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Il ___ son manteau. » (mettre)', 'met — à la troisième personne du singulier, mettre ne prend pas de terminaison après le t du radical.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'met', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'mets', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'mette', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Say that you love reading (use adorer + infinitive).', 'j''adore lire — after a verb of taste, the second verb stays in the infinitive.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dites que vous adorez lire (employez adorer + infinitif).', 'j''adore lire — après un verbe de goût, le second verbe reste à l''infinitif.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'j''adore lire'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'jadore lire'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l06-verbes-relation';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Saying « je t''aime bien » to someone is a declaration of love.', 'False. Je t''aime bien is friendly. Removing bien — je t''aime — turns it into a declaration of love.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dire « je t''aime bien » à quelqu''un est une déclaration d''amour.', 'Faux. Je t''aime bien est amical. C''est en retirant bien — je t''aime — que la phrase devient une déclaration d''amour.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l06-verbes-relation' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 7 : Pouvoir, vouloir, devoir
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l07-pouvoir-vouloir-devoir', 7, 35, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Can, want, must', 'Three verbs that let you request, refuse and explain an obligation — politely.', 'Can make simple requests, express a wish and state an obligation.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Pouvoir, vouloir, devoir', 'Trois verbes pour demander, refuser et expliquer une obligation — poliment.', 'Peut formuler une demande simple, exprimer un souhait et énoncer une obligation.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=KsfU9Qm7PpU', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The three modal verbs', '| | pouvoir | vouloir | devoir |
|---|---|---|---|
| je | peux | veux | dois |
| tu | peux | veux | dois |
| il / elle | peut | veut | doit |
| nous | pouvons | voulons | devons |
| vous | pouvez | voulez | devez |
| ils / elles | peuvent | veulent | doivent |

All three are followed by an **infinitive**:
- *Je peux venir demain.*
- *Je veux apprendre le français.*
- *Je dois partir maintenant.*

They are the backbone of any practical exchange: asking permission, stating a need, explaining a constraint.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les trois verbes modaux', '| | pouvoir | vouloir | devoir |
|---|---|---|---|
| je | peux | veux | dois |
| tu | peux | veux | dois |
| il / elle | peut | veut | doit |
| nous | pouvons | voulons | devons |
| vous | pouvez | voulez | devez |
| ils / elles | peuvent | veulent | doivent |

Les trois sont suivis d''un **infinitif** :
- *Je peux venir demain.*
- *Je veux apprendre le français.*
- *Je dois partir maintenant.*

Ce sont les piliers de tout échange pratique : demander une autorisation, exprimer un besoin, expliquer une contrainte.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=-COcPVEp5tw', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Il faut: impersonal obligation', '**Il faut** never changes form — there is no *je faut*. It expresses a general necessity:

- *Il faut un justificatif de domicile.* — A proof of address is required.
- *Il faut arriver à l''heure.* — One must arrive on time.
- *Il ne faut pas oublier les originaux.* — You must not forget the originals.

The difference from **devoir** is who is concerned:
- *Je dois partir* — I, personally, must leave.
- *Il faut partir* — leaving is what the situation requires, for everyone.

At a counter, *il faut…* is the phrase you will hear most when a document is missing.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Il faut : l''obligation impersonnelle', '**Il faut** est invariable — il n''existe pas de *je faut*. Cette forme exprime une nécessité générale :

- *Il faut un justificatif de domicile.*
- *Il faut arriver à l''heure.*
- *Il ne faut pas oublier les originaux.*

La différence avec **devoir** tient à la personne concernée :
- *Je dois partir* — moi, personnellement.
- *Il faut partir* — la situation l''exige, pour tout le monde.

À un guichet, *il faut…* est la formule que l''on entend le plus lorsqu''un document manque.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Asking politely: the conditional', 'A direct *je veux* sounds abrupt in French — close to *I demand*. In shops, offices and any formal setting, the polite form is used instead:

| direct | polite |
|---|---|
| Je veux un café. | **Je voudrais** un café. |
| Vous pouvez m''aider ? | **Pourriez-vous** m''aider ? |
| Donnez-moi le formulaire. | **Pourrais-je avoir** le formulaire ? |

**Je voudrais** and **pourriez-vous** are worth learning as fixed blocks right now, long before studying the conditional as a tense. They cost one word more and change how you are received.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Demander poliment : le conditionnel', 'Un *je veux* direct sonne brusque en français — proche de « j''exige ». Dans les commerces, les administrations et tout cadre formel, on emploie la forme polie :

| direct | poli |
|---|---|
| Je veux un café. | **Je voudrais** un café. |
| Vous pouvez m''aider ? | **Pourriez-vous** m''aider ? |
| Donnez-moi le formulaire. | **Pourrais-je avoir** le formulaire ? |

**Je voudrais** et **pourriez-vous** méritent d''être appris comme des blocs figés dès maintenant, bien avant d''étudier le conditionnel comme temps. Ils coûtent un mot de plus et changent l''accueil qui vous est réservé.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'pouvoir', 'pu.vwaʁ', 'Est-ce que je peux poser une question ?'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'can, to be able to', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir la possibilité ou la permission', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'vouloir', 'vu.lwaʁ', 'Je veux apprendre vite.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to want', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir la volonté de', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'devoir', 'd(ə).vwaʁ', 'Je dois renouveler mon titre de séjour.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'must, to have to', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'être dans l''obligation de', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'il faut', 'il.fo', 'Il faut deux photos d''identité.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'it is necessary, you need', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'expression impersonnelle d''obligation', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'je voudrais', 'ʒə.vu.dʁɛ', 'Je voudrais un rendez-vous, s''il vous plaît.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'I would like', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'forme polie de « je veux »', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'possible', 'pɔ.sibl', 'Est-ce que c''est possible aujourd''hui ?'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'possible', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui peut se faire', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'interdit(e)', 'ɛ̃.tɛʁ.di', 'Il est interdit de fumer ici.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'forbidden', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui n''est pas autorisé', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'obligatoire', 'ɔ.bli.ɡa.twaʁ', 'Le rendez-vous est obligatoire.'
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'compulsory', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'que l''on ne peut pas éviter', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Ils ___ venir demain. » (pouvoir)', 'peuvent — an irregular third person plural worth memorising.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Ils ___ venir demain. » (pouvoir)', 'peuvent — une troisième personne du pluriel irrégulière, à mémoriser.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'peuvent', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'peux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'pouvent', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'At a counter, which request is the most appropriate?', 'Je voudrais un rendez-vous, s''il vous plaît. The polite form is expected in any formal exchange.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'À un guichet, quelle demande est la plus appropriée ?', 'Je voudrais un rendez-vous, s''il vous plaît. La forme polie est attendue dans tout échange formel.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je voudrais un rendez-vous, s''il vous plaît.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je veux un rendez-vous.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Donnez-moi un rendez-vous.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence uses « il faut » correctly?', 'Il faut un justificatif. Il faut is impersonal: « je faut » does not exist.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase emploie correctement « il faut » ?', 'Il faut un justificatif. Il faut est impersonnel : « je faut » n''existe pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Il faut un justificatif.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je faut un justificatif.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Nous fallons un justificatif.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ___ renouveler mon titre de séjour. » (personal obligation)', 'dois — devoir expresses an obligation that concerns me personally.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ___ renouveler mon titre de séjour. » (obligation personnelle)', 'dois — devoir exprime une obligation qui me concerne personnellement.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'dois'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l07-pouvoir-vouloir-devoir';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'After pouvoir, vouloir and devoir, the second verb is conjugated.', 'False. The second verb stays in the infinitive: je peux venir, not je peux viens.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Après pouvoir, vouloir et devoir, le second verbe se conjugue.', 'Faux. Le second verbe reste à l''infinitif : je peux venir, et non je peux viens.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l07-pouvoir-vouloir-devoir' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 8 : Les prépositions de lieu
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l08-prepositions-de-lieu', 8, 30, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Prepositions of place', 'À, de, dans, sur, chez, en — six small words that decide where things are.', 'Can locate objects and places and give a simple address.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les prépositions de lieu', 'À, de, dans, sur, chez, en — six petits mots qui situent tout.', 'Peut situer des objets et des lieux et donner une adresse simple.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=8UrgQq0OqWg', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The six essential prepositions', '| preposition | use | example |
|---|---|---|
| **à** | a point, a place | je suis **à** la maison |
| **de** | origin, starting point | je viens **de** Madrid |
| **dans** | inside something closed | les clés sont **dans** le sac |
| **sur** | on a surface | le livre est **sur** la table |
| **chez** | at someone''s place | je vais **chez** le médecin |
| **en** | a means, a material, a feminine country | **en** bus, **en** France |

**chez** has no English equivalent: it means *at the home or premises of*. *Chez moi, chez le coiffeur, chez Renault.* Never *à la maison de Marie* — say *chez Marie*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les six prépositions essentielles', '| préposition | emploi | exemple |
|---|---|---|
| **à** | un point, un lieu | je suis **à** la maison |
| **de** | l''origine, le point de départ | je viens **de** Madrid |
| **dans** | à l''intérieur d''un espace fermé | les clés sont **dans** le sac |
| **sur** | sur une surface | le livre est **sur** la table |
| **chez** | au domicile ou au local de quelqu''un | je vais **chez** le médecin |
| **en** | un moyen, une matière, un pays féminin | **en** bus, **en** France |

**chez** n''a pas d''équivalent simple en anglais : il désigne le domicile ou l''établissement d''une personne. *Chez moi, chez le coiffeur, chez Renault.* On ne dit pas *à la maison de Marie*, mais *chez Marie*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Contractions with à and de', 'This is the point where most written mistakes happen:

| | + le | + la | + l'' | + les |
|---|---|---|---|---|
| **à** | **au** | à la | à l'' | **aux** |
| **de** | **du** | de la | de l'' | **des** |

- je vais **au** marché (à + le)
- je viens **du** travail (de + le)
- je parle **aux** enfants (à + les)
- la porte **des** voisins (de + les)

*à le* and *de le* simply do not exist in written French.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les contractions avec à et de', 'C''est ici que se concentrent la plupart des fautes écrites :

| | + le | + la | + l'' | + les |
|---|---|---|---|---|
| **à** | **au** | à la | à l'' | **aux** |
| **de** | **du** | de la | de l'' | **des** |

- je vais **au** marché (à + le)
- je viens **du** travail (de + le)
- je parle **aux** enfants (à + les)
- la porte **des** voisins (de + les)

*à le* et *de le* n''existent tout simplement pas à l''écrit.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Locating precisely', 'devant · derrière · à côté de · en face de · entre · sous · au-dessus de · au bout de · au coin de · près de · loin de

A typical set of directions, as you would actually hear it:

> *La pharmacie ? C''est au bout de la rue, à côté de la banque, en face de l''arrêt de bus. C''est à deux minutes.*

Writing an address, French puts the number first, then the street: **12, rue Victor Hugo — 69003 Lyon**. The five-digit postcode comes before the city name.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Situer avec précision', 'devant · derrière · à côté de · en face de · entre · sous · au-dessus de · au bout de · au coin de · près de · loin de

Un enchaînement d''indications tel qu''on l''entend réellement :

> *La pharmacie ? C''est au bout de la rue, à côté de la banque, en face de l''arrêt de bus. C''est à deux minutes.*

Pour écrire une adresse, le français place le numéro avant la rue : **12, rue Victor Hugo — 69003 Lyon**. Le code postal à cinq chiffres précède le nom de la ville.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'chez', 'ʃe', 'Je vais chez le médecin à 15 heures.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'at / to someone''s place', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'au domicile ou au local de quelqu''un', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'dans', 'dɑ̃', 'Mes papiers sont dans le tiroir.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'in, inside', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à l''intérieur de', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'sur', 'syʁ', 'Le formulaire est sur la table.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'on', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'au-dessus et en contact', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'à côté de', 'a.ko.te.də', 'La banque est à côté de la poste.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'next to', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'tout près, juste à côté', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'entre', 'ɑ̃tʁ', 'La pharmacie est entre l''école et la mairie.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'between', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'au milieu de deux éléments', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'près de / loin de', 'pʁɛ.də / lwɛ̃.də', 'J''habite près de la gare.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'near / far from', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à faible distance / à grande distance', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'une rue', 'ʁy', 'J''habite 12, rue Victor Hugo.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a street', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'voie de circulation en ville', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'le code postal', 'kɔd.pɔs.tal', 'Le code postal de Lyon 3e est 69003.'
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the postcode', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'numéro à cinq chiffres qui identifie la commune', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je vais ___ médecin. »', 'chez le médecin — chez is used with people and professionals.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je vais ___ médecin. »', 'chez le médecin — chez s''emploie avec les personnes et les professionnels.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'chez le', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'à le', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'dans le', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'au', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je reviens ___ travail. »', 'du travail — de + le contracts to du.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je reviens ___ travail. »', 'du travail — de + le se contracte en du.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'du', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'de le', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'des', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'au', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Le livre est ___ la table. » (on the surface)', 'sur la table. Dans la table would mean inside the table itself.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Le livre est ___ la table. » (sur la surface)', 'sur la table. Dans la table signifierait à l''intérieur du meuble.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'sur', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'dans', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'à', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'chez', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je parle ___ enfants. » (à + les)', 'aux — à + les always contracts to aux.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je parle ___ enfants. » (à + les)', 'aux — à + les se contracte toujours en aux.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'aux'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l08-prepositions-de-lieu';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In a French address, the street name comes before the number.', 'False. The number comes first: 12, rue Victor Hugo.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dans une adresse française, le nom de la rue précède le numéro.', 'Faux. Le numéro vient en premier : 12, rue Victor Hugo.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l08-prepositions-de-lieu' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 9 : Les adverbes de temps et de fréquence
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l09-adverbes-de-temps', 9, 30, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Adverbs of time and frequency', 'Say when and how often — and place the adverb where a French speaker expects it.', 'Can situate actions in time and describe habits and their frequency.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les adverbes de temps et de fréquence', 'Dire quand et à quelle fréquence — et placer l''adverbe là où un francophone l''attend.', 'Peut situer des actions dans le temps et décrire des habitudes et leur fréquence.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=Ukc05X5h8J8', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'When: adverbs of time', '| past | present | future |
|---|---|---|
| hier | aujourd''hui | demain |
| avant-hier | maintenant | après-demain |
| la semaine dernière | en ce moment | la semaine prochaine |
| l''année dernière | actuellement | l''année prochaine |
| autrefois | | bientôt |

Also useful: **d''abord** (first), **ensuite / puis** (then), **enfin** (finally), **tout de suite** (right away), **déjà** (already), **encore** (still, again), **ne … jamais** (never).

These linking words are what turn a list of sentences into a story: *D''abord je me lève, ensuite je prends le bus, enfin j''arrive au travail.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Quand : les adverbes de temps', '| passé | présent | futur |
|---|---|---|
| hier | aujourd''hui | demain |
| avant-hier | maintenant | après-demain |
| la semaine dernière | en ce moment | la semaine prochaine |
| l''année dernière | actuellement | l''année prochaine |
| autrefois | | bientôt |

Également utiles : **d''abord**, **ensuite / puis**, **enfin**, **tout de suite**, **déjà**, **encore**, **ne … jamais**.

Ce sont ces connecteurs qui transforment une liste de phrases en récit : *D''abord je me lève, ensuite je prends le bus, enfin j''arrive au travail.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=CUEJ48Og9nY', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'How often: adverbs of frequency', 'From most to least frequent:

**toujours** → **souvent** → **quelquefois / parfois** → **rarement** → **ne … jamais**

And with a fixed rhythm: *tous les jours*, *toutes les semaines*, *une fois par mois*, *deux fois par an*.

- *Je prends **toujours** le bus.*
- *Je vais **souvent** à la bibliothèque.*
- *Je ne regarde **jamais** la télévision.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'À quelle fréquence : les adverbes de fréquence', 'Du plus fréquent au moins fréquent :

**toujours** → **souvent** → **quelquefois / parfois** → **rarement** → **ne … jamais**

Et avec un rythme fixe : *tous les jours*, *toutes les semaines*, *une fois par mois*, *deux fois par an*.

- *Je prends **toujours** le bus.*
- *Je vais **souvent** à la bibliothèque.*
- *Je ne regarde **jamais** la télévision.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Where the adverb goes', 'This is the part learners most often get wrong, because the rule differs from English.

**Present tense — right after the verb:**
- *Je mange **souvent** au restaurant.* (not *je souvent mange*)

**Passé composé — between the auxiliary and the participle:**
- *J''ai **souvent** mangé au restaurant.*
- *Je n''ai **jamais** mangé au restaurant.*

**Time adverbs can move to the front for emphasis:**
- *Hier, j''ai travaillé.* / *J''ai travaillé hier.* — both correct.

But short frequency adverbs — souvent, toujours, jamais — stay glued to the verb.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Où se place l''adverbe', 'C''est le point que les apprenants manquent le plus souvent, car la règle diffère de celle de l''anglais.

**Au présent — juste après le verbe :**
- *Je mange **souvent** au restaurant.* (et non *je souvent mange*)

**Au passé composé — entre l''auxiliaire et le participe :**
- *J''ai **souvent** mangé au restaurant.*
- *Je n''ai **jamais** mangé au restaurant.*

**Les adverbes de temps peuvent passer en tête pour insister :**
- *Hier, j''ai travaillé.* / *J''ai travaillé hier.* — les deux sont corrects.

En revanche, les adverbes de fréquence courts — souvent, toujours, jamais — restent collés au verbe.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'toujours', 'tu.ʒuʁ', 'Je prends toujours le même bus.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'always', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à chaque fois, sans exception', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'souvent', 'su.vɑ̃', 'Je vais souvent à la bibliothèque.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'often', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'de nombreuses fois', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'parfois', 'paʁ.fwa', 'Parfois, je travaille le samedi.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'sometimes', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'de temps en temps', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'rarement', 'ʁaʁ.mɑ̃', 'Je sors rarement le soir.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'rarely', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'peu souvent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'ne … jamais', 'nə.ʒa.mɛ', 'Je ne bois jamais de café le soir.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'never', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à aucun moment', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'd''abord', 'da.bɔʁ', 'D''abord, je remplis le formulaire.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'first, to begin with', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'en premier lieu', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'ensuite', 'ɑ̃.sɥit', 'Ensuite, je vais au guichet.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'then, next', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'après cela', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'une fois par semaine', 'yn.fwa.paʁ.s(ə).mɛn', 'J''ai un cours une fois par semaine.'
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'once a week', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à raison d''une fois chaque semaine', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence is correct?', 'Je mange souvent au restaurant. In the present tense the adverb follows the verb.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase est correcte ?', 'Je mange souvent au restaurant. Au présent, l''adverbe suit le verbe.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je mange souvent au restaurant.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je souvent mange au restaurant.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Where does « jamais » go in the passé composé?', 'Between the auxiliary and the participle: je n''ai jamais mangé.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Où se place « jamais » au passé composé ?', 'Entre l''auxiliaire et le participe : je n''ai jamais mangé.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Entre l''auxiliaire et le participe', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Après le participe', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Avant le sujet', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which adverb expresses the highest frequency?', 'toujours — every single time. Then souvent, parfois, rarement, jamais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel adverbe exprime la fréquence la plus élevée ?', 'toujours — à chaque fois. Viennent ensuite souvent, parfois, rarement, jamais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'toujours', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'souvent', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'parfois', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'rarement', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete the sequence: « ___, je remplis le formulaire ; ensuite, je vais au guichet. »', 'D''abord — it opens a sequence, with ensuite and enfin following.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez la séquence : « ___, je remplis le formulaire ; ensuite, je vais au guichet. »', 'D''abord — cet adverbe ouvre une séquence, que poursuivent ensuite et enfin.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'd''abord'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'dabord'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l09-adverbes-de-temps';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Hier, j''ai travaillé » and « J''ai travaillé hier » are both correct.', 'True. Time adverbs may open or close the sentence; the front position adds emphasis.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Hier, j''ai travaillé » et « J''ai travaillé hier » sont tous deux corrects.', 'Vrai. Les adverbes de temps peuvent ouvrir ou clore la phrase ; la position initiale insiste davantage.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l09-adverbes-de-temps' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 10 : Consolider sa conjugaison
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u2-l10-consolidation-conjugaison', 10, 35, TRUE
FROM units WHERE slug = 'a1-unit-2';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Consolidating your conjugation', 'A method for making conjugation automatic, and a review of the whole unit.', 'Can select the right tense and auxiliary in simple everyday sentences.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Consolider sa conjugaison', 'Une méthode pour automatiser la conjugaison, et la révision de toute l''unité.', 'Peut choisir le temps et l''auxiliaire corrects dans des phrases simples du quotidien.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'SUMMARY', 'https://www.youtube.com/watch?v=qmC89o87f_0', 'VIDEO'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Six habits that actually work', '1. **Work from frequency, not from the alphabet.** Twenty verbs cover most conversations. Master those before opening a conjugation book at page one.
2. **One verb, one personal sentence.** *Je travaille dans un restaurant* sticks; a column of endings does not.
3. **Say it out loud.** Three of the six present forms sound the same; only your ear will teach you that.
4. **Revise little and often.** Ten minutes a day beats two hours once a week.
5. **Write three sentences every evening** about your day, in the passé composé. It is the cheapest, most effective exercise there is.
6. **Accept mistakes.** A sentence with an error that is understood is worth more than a perfect sentence you never said.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Six habitudes qui fonctionnent vraiment', '1. **Partez de la fréquence, non de l''alphabet.** Vingt verbes couvrent l''essentiel des conversations. Maîtrisez-les avant d''ouvrir un livre de conjugaison à la page un.
2. **Un verbe, une phrase personnelle.** *Je travaille dans un restaurant* se retient ; une colonne de terminaisons non.
3. **Prononcez à voix haute.** Trois des six formes du présent se prononcent de manière identique ; seule l''oreille l''apprend.
4. **Révisez peu, mais souvent.** Dix minutes par jour valent mieux que deux heures par semaine.
5. **Écrivez trois phrases chaque soir** sur votre journée, au passé composé. C''est l''exercice le plus rentable qui soit.
6. **Acceptez l''erreur.** Une phrase fautive mais comprise vaut mieux qu''une phrase parfaite jamais prononcée.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Choosing the right tense', '| the action | tense | example |
|---|---|---|
| is happening now | présent | *je travaille* |
| is a habit | présent | *je travaille tous les jours* |
| started in the past, still true | présent + depuis | *je travaille ici depuis deux ans* |
| just happened | venir de + inf. | *je viens de finir* |
| is finished | passé composé | *j''ai travaillé hier* |
| is about to happen | aller + inf. | *je vais travailler demain* |

With these six patterns, an A1 speaker can cover almost any everyday situation — without ever conjugating the futur simple or the subjunctive.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Choisir le bon temps', '| l''action | temps | exemple |
|---|---|---|
| se déroule maintenant | présent | *je travaille* |
| est une habitude | présent | *je travaille tous les jours* |
| a commencé et dure encore | présent + depuis | *je travaille ici depuis deux ans* |
| vient de se produire | venir de + inf. | *je viens de finir* |
| est achevée | passé composé | *j''ai travaillé hier* |
| va se produire | aller + inf. | *je vais travailler demain* |

Avec ces six schémas, un locuteur de niveau A1 couvre presque toutes les situations du quotidien — sans jamais conjuguer le futur simple ni le subjonctif.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'SUMMARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Unit 2 checklist', 'You should now be able to:

- name the twenty most frequent verbs and use them in the present tense
- build the passé composé and choose between avoir and être
- describe your day using reflexive verbs
- talk about your home, your town and its services
- ask politely with *je voudrais* and *pourriez-vous*
- explain an obligation with *devoir* and *il faut*
- locate things with à, de, dans, sur, chez, en
- say how often you do something, with the adverb in the right place

If two or three of these are still shaky, go back to that lesson rather than moving on. Unit 3 builds directly on the passé composé.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Bilan de l''unité 2', 'Vous devez maintenant être capable de :

- nommer les vingt verbes les plus fréquents et les employer au présent
- construire le passé composé et choisir entre avoir et être
- décrire votre journée à l''aide des verbes pronominaux
- parler de votre logement, de votre ville et de ses services
- demander poliment avec *je voudrais* et *pourriez-vous*
- exprimer une obligation avec *devoir* et *il faut*
- situer avec à, de, dans, sur, chez, en
- dire à quelle fréquence vous faites quelque chose, en plaçant correctement l''adverbe

Si deux ou trois de ces points restent fragiles, revenez à la leçon concernée plutôt que d''avancer : l''unité 3 s''appuie directement sur le passé composé.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'réviser', 'ʁe.vi.ze', 'Je révise dix minutes chaque soir.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to revise, to review', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'reprendre ce que l''on a appris', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'une erreur', 'e.ʁœʁ', 'Ce n''est pas grave, c''est une petite erreur.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a mistake', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ce qui n''est pas correct', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'progresser', 'pʁɔ.ɡʁe.se', 'Je progresse lentement mais sûrement.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to make progress', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avancer, s''améliorer', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 's''entraîner', 'sɑ̃.tʁe.ne', 'Je m''entraîne à parler tous les jours.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to practise, to train', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'répéter un exercice pour s''améliorer', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'facile / difficile', 'fa.sil / di.fi.sil', 'Le passé composé est difficile au début.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'easy / difficult', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui demande peu / beaucoup d''effort', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'petit à petit', 'p(ə).ti.ta.p(ə).ti', 'Petit à petit, je comprends mieux.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'little by little', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'progressivement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'un exercice', 'ɛɡ.zɛʁ.sis', 'Faites l''exercice trois avant demain.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an exercise', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'activité d''entraînement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'se souvenir de', 'sə.suv.niʁ.də', 'Je me souviens de cette règle.'
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to remember', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'garder en mémoire', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Je ___ ici depuis deux ans. » Which tense does French use?', 'travaille — the present. With depuis, an action that is still going on stays in the present, unlike English.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Je ___ ici depuis deux ans. » Quel temps emploie le français ?', 'travaille — le présent. Avec depuis, une action encore en cours reste au présent, contrairement à l''anglais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'travaille (présent)', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'ai travaillé (passé composé)', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'vais travailler', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which sentence describes an action that has just happened?', 'Je viens de finir. Venir de + infinitive is the immediate past.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle phrase décrit une action qui vient de se produire ?', 'Je viens de finir. Venir de + infinitif exprime le passé immédiat.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je viens de finir.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je vais finir.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je finis.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Hier, nous ___ allés au marché. »', 'sommes — aller takes être, and the participle agrees with the subject: allés.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Hier, nous ___ allés au marché. »', 'sommes — aller se conjugue avec être, et le participe s''accorde avec le sujet : allés.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'sommes', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'avons', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'étions', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Put into the passé composé: « Je me lève à six heures. » → « Je ___ ___ ___ à six heures. »', 'me suis levé — reflexive verbs always take être, and the pronoun stays before the auxiliary.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Mettez au passé composé : « Je me lève à six heures. » → « Je ___ ___ ___ à six heures. »', 'me suis levé — les verbes pronominaux prennent toujours être, et le pronom reste devant l''auxiliaire.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'me suis levé'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'me suis levée'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'me suis leve'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u2-l10-consolidation-conjugaison';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'A sentence with a mistake that is understood is more useful than a perfect sentence never spoken.', 'True. Communication comes first; accuracy is built through use. Waiting to be perfect is the surest way never to speak.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Une phrase fautive mais comprise est plus utile qu''une phrase parfaite jamais prononcée.', 'Vrai. La communication prime ; la correction se construit par l''usage. Attendre d''être parfait est le moyen le plus sûr de ne jamais parler.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u2-l10-consolidation-conjugaison' AND e.position = 5 AND o.position = 2;
