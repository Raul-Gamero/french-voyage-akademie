-- ==================================================================
-- Contenu académique — niveau A1, unité 3
-- Unité 3 — Raconter, comparer, s'exprimer
--
-- FICHIER GÉNÉRÉ. Ne pas modifier à la main : éditer
--   content/a1/unit-3.json
-- puis relancer  python tools/generate_seed.py
-- ==================================================================

-- Unité 3 : Unité 3 — Raconter, comparer, s'exprimer
INSERT INTO units (level_id, slug, position, published)
SELECT id, 'a1-unit-3', 3, TRUE
FROM levels WHERE code = 'A1';

INSERT INTO unit_translations (unit_id, locale, title, description)
SELECT id, 'en', 'Unit 3 — Telling, comparing, expressing yourself', 'Tell a story in the past, ask real questions, compare things, say no properly, and step into authentic French through reading, film and music.'
FROM units WHERE slug = 'a1-unit-3';
INSERT INTO unit_translations (unit_id, locale, title, description)
SELECT id, 'fr', 'Unité 3 — Raconter, comparer, s''exprimer', 'Raconter au passé, poser de vraies questions, comparer, dire non correctement, et entrer dans le français authentique par la lecture, le cinéma et la musique.'
FROM units WHERE slug = 'a1-unit-3';

-- ------------------------------------------------------------------
-- Leçon 1 : Lecture : l'histoire de Marie
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l01-lecture-histoire-de-marie', 1, 35, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Reading: the story of Marie', 'A first continuous text — and the two past tenses that carry any story.', 'Can understand short, simple narrative texts on familiar topics.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Lecture : l''histoire de Marie', 'Un premier texte suivi — et les deux temps du passé qui portent tout récit.', 'Peut comprendre des textes narratifs courts et simples sur des sujets familiers.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'READING', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Marie and her grandfather''s library', 'Read the text twice: once for the overall meaning, once looking at the verbs in bold.

> Il y a longtemps, dans un petit village français, **vivait** une jeune fille nommée Marie. Chaque jour, après l''école, Marie **rentrait** chez elle et **se plongeait** dans les livres de la bibliothèque de son grand-père. Elle **adorait** lire.
>
> Un jour, alors qu''elle **avait** à peine dix ans, Marie **a découvert** un vieux livre poussiéreux au fond de l''étagère. Lorsqu''elle l''**a ouvert**, elle **a été** transportée dans un autre temps. L''histoire **se déroulait** dans un château médiéval, et les chevaliers **combattaient** des dragons.
>
> Les semaines **ont passé**, et Marie **lisait** ce livre chaque soir. Elle **vivait** l''histoire comme si elle **était** là.
>
> Aujourd''hui, Marie **est devenue** une auteure reconnue. Mais elle n''**oublie** jamais ce vieux livre qui **a changé** sa vie.

Notice the two colours of the past: some verbs describe a setting that lasts (*vivait, rentrait, adorait*), others report a single event that moves the story on (*a découvert, a ouvert, est devenue*).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Marie et la bibliothèque de son grand-père', 'Lisez le texte deux fois : une première pour le sens général, une seconde en observant les verbes en gras.

> Il y a longtemps, dans un petit village français, **vivait** une jeune fille nommée Marie. Chaque jour, après l''école, Marie **rentrait** chez elle et **se plongeait** dans les livres de la bibliothèque de son grand-père. Elle **adorait** lire.
>
> Un jour, alors qu''elle **avait** à peine dix ans, Marie **a découvert** un vieux livre poussiéreux au fond de l''étagère. Lorsqu''elle l''**a ouvert**, elle **a été** transportée dans un autre temps. L''histoire **se déroulait** dans un château médiéval, et les chevaliers **combattaient** des dragons.
>
> Les semaines **ont passé**, et Marie **lisait** ce livre chaque soir. Elle **vivait** l''histoire comme si elle **était** là.
>
> Aujourd''hui, Marie **est devenue** une auteure reconnue. Mais elle n''**oublie** jamais ce vieux livre qui **a changé** sa vie.

Observez les deux couleurs du passé : certains verbes décrivent un décor qui dure (*vivait, rentrait, adorait*), d''autres rapportent un événement unique qui fait avancer l''histoire (*a découvert, a ouvert, est devenue*).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Two past tenses, two jobs', '| | imparfait | passé composé |
|---|---|---|
| role | the background, the setting | the event that happens |
| question it answers | what was it like? | what happened? |
| typical markers | chaque jour, souvent, toujours, quand j''étais | un jour, soudain, hier, une fois |
| example | *il **pleuvait*** | *j''**ai pris** le bus* |

A story usually needs both at once:

> *Il **pleuvait** et j''**attendais** le bus depuis vingt minutes **quand** mon voisin **est arrivé** en voiture.*

The rain and the waiting are the backdrop; the neighbour arriving is the event. Change the tense and you change the meaning, not just the style.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Deux passés, deux rôles', '| | imparfait | passé composé |
|---|---|---|
| rôle | le décor, la situation | l''événement qui survient |
| question posée | comment était-ce ? | que s''est-il passé ? |
| marqueurs typiques | chaque jour, souvent, toujours, quand j''étais | un jour, soudain, hier, une fois |
| exemple | *il **pleuvait*** | *j''**ai pris** le bus* |

Un récit demande le plus souvent les deux à la fois :

> *Il **pleuvait** et j''**attendais** le bus depuis vingt minutes **quand** mon voisin **est arrivé** en voiture.*

La pluie et l''attente forment le décor ; l''arrivée du voisin est l''événement. Changer de temps change le sens, non le seul style.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'SUMMARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'How to read at A1', '1. **Read the whole text without a dictionary.** Tolerate the gaps.
2. **Underline only the words that block understanding** — usually far fewer than you expect.
3. **Look those up, then read again.**
4. **Read it out loud once.** Reading aloud links spelling to sound, which is where French is hardest.

A text you understand at 70 % is the right level. If you need the dictionary for every line, the text is too hard — not you.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Comment lire au niveau A1', '1. **Lisez le texte entier sans dictionnaire.** Acceptez les trous.
2. **Soulignez uniquement les mots qui bloquent la compréhension** — ils sont en général bien moins nombreux qu''on ne le croit.
3. **Cherchez ceux-là, puis relisez.**
4. **Lisez une fois à voix haute.** La lecture orale relie l''orthographe au son, là où le français est le plus difficile.

Un texte compris à 70 % est au bon niveau. Si le dictionnaire est nécessaire à chaque ligne, c''est le texte qui est trop difficile, pas vous.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'une histoire', 'is.twaʁ', 'Raconte-moi une histoire.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a story; history', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'récit ; suite d''événements', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'un livre', 'livʁ', 'J''ai emprunté un livre à la bibliothèque.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a book', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ouvrage imprimé', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'lire', 'liʁ', 'Je lis dix minutes chaque soir.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to read', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'prendre connaissance d''un texte écrit', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'découvrir', 'de.ku.vʁiʁ', 'J''ai découvert un auteur sénégalais.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to discover', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'trouver ce que l''on ne connaissait pas', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'raconter', 'ʁa.kɔ̃.te', 'Elle raconte son voyage en Algérie.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to tell, to recount', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'faire le récit de quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'autrefois', 'o.tʁə.fwa', 'Autrefois, j''habitais à la campagne.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'in the past, formerly', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'il y a longtemps', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'devenir', 'd(ə)v.niʁ', 'Elle est devenue infirmière.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to become', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'passer à un nouvel état', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un souvenir', 'suv.niʁ', 'J''ai de bons souvenirs de cette année.'
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a memory', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ce que l''on garde en mémoire', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In the text, which verb describes the setting rather than an event?', '« adorait » — an imparfait describing a lasting habit. « A découvert » reports a single event.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dans le texte, quel verbe décrit le décor plutôt qu''un événement ?', '« adorait » — un imparfait qui décrit une habitude durable. « A découvert » rapporte un événement unique.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'adorait', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'a découvert', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'est devenue', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which tense answers the question « what happened? »', 'The passé composé reports events. The imparfait answers « what was it like? ».'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel temps répond à la question « que s''est-il passé ? »', 'Le passé composé rapporte les événements. L''imparfait répond à « comment était-ce ? ».'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Le passé composé', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'L''imparfait', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Le présent', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Il pleuvait quand je suis sorti. » What does the imparfait express here?', 'The rain is the backdrop already in place; going out is the event that occurs against it.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Il pleuvait quand je suis sorti. » Qu''exprime ici l''imparfait ?', 'La pluie est le décor déjà installé ; la sortie est l''événement qui survient sur ce fond.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Le décor, déjà en place', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Un événement soudain', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Une action future', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete with the imparfait: « Chaque jour, Marie ___ chez elle après l''école. » (rentrer)', 'rentrait — « chaque jour » marks a repeated habit, which calls for the imparfait.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez à l''imparfait : « Chaque jour, Marie ___ chez elle après l''école. » (rentrer)', 'rentrait — « chaque jour » marque une habitude répétée, qui appelle l''imparfait.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'rentrait'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l01-lecture-histoire-de-marie';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'At A1, you should look up every unknown word before finishing a text.', 'False. Read the whole text first, tolerating gaps, then look up only the words that actually block understanding.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Au niveau A1, il faut chercher chaque mot inconnu avant de finir un texte.', 'Faux. Lisez d''abord le texte entier en tolérant les trous, puis cherchez seulement les mots qui bloquent réellement la compréhension.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l01-lecture-histoire-de-marie' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 2 : L'imparfait
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l02-imparfait', 2, 35, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'The imparfait', 'One ending pattern, one irregular verb — and a tense you can build from « nous ».', 'Can describe past habits, situations and states in simple terms.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'L''imparfait', 'Un seul jeu de terminaisons, un seul verbe irrégulier — et un temps qui se fabrique à partir de « nous ».', 'Peut décrire des habitudes, des situations et des états passés en termes simples.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=culF1WXnaOw', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'How to build it', 'The imparfait is the most regular tense in French. Three steps:

1. Take the **nous** form of the present: *nous **parl**ons*, *nous **finiss**ons*, *nous **pren**ons*.
2. Remove **-ons**.
3. Add the endings **-ais, -ais, -ait, -ions, -iez, -aient**.

| | parler | finir | prendre |
|---|---|---|---|
| je | parlais | finissais | prenais |
| tu | parlais | finissais | prenais |
| il / elle | parlait | finissait | prenait |
| nous | parlions | finissions | prenions |
| vous | parliez | finissiez | preniez |
| ils / elles | parlaient | finissaient | prenaient |

**One single exception in the whole language: être** → j''étais, tu étais, il était, nous étions, vous étiez, ils étaient.

And a pronunciation gift: *-ais, -ait, -aient* all sound identical, [ɛ].'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Comment le former', 'L''imparfait est le temps le plus régulier du français. Trois étapes :

1. Prenez la forme **nous** du présent : *nous **parl**ons*, *nous **finiss**ons*, *nous **pren**ons*.
2. Retirez **-ons**.
3. Ajoutez les terminaisons **-ais, -ais, -ait, -ions, -iez, -aient**.

| | parler | finir | prendre |
|---|---|---|---|
| je | parlais | finissais | prenais |
| tu | parlais | finissais | prenais |
| il / elle | parlait | finissait | prenait |
| nous | parlions | finissions | prenions |
| vous | parliez | finissiez | preniez |
| ils / elles | parlaient | finissaient | prenaient |

**Une seule exception dans toute la langue : être** → j''étais, tu étais, il était, nous étions, vous étiez, ils étaient.

Et un cadeau de prononciation : *-ais, -ait, -aient* se prononcent tous [ɛ], de manière identique.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=iUuSeytyT4E', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'When to use it', 'Four uses cover everything at A1:

**1. A past habit** — *Quand j''étais enfant, je **jouais** au football tous les jours.*
**2. A description in the past** — *Il **faisait** froid et la rue **était** vide.*
**3. An ongoing action interrupted by another** — *Je **dormais** quand le téléphone **a sonné**.*
**4. Politeness** — *Je **voulais** vous demander quelque chose.* Softer than *je veux*.

A quick test: if English would say *used to* or *was …-ing*, French almost always wants the imparfait.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Quand l''employer', 'Quatre emplois couvrent tout au niveau A1 :

**1. Une habitude passée** — *Quand j''étais enfant, je **jouais** au football tous les jours.*
**2. Une description au passé** — *Il **faisait** froid et la rue **était** vide.*
**3. Une action en cours interrompue par une autre** — *Je **dormais** quand le téléphone **a sonné**.*
**4. La politesse** — *Je **voulais** vous demander quelque chose.* Plus doux que *je veux*.

Un test rapide : si l''anglais dirait *used to* ou *was …-ing*, le français demande presque toujours l''imparfait.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'GRAMMAR', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Imparfait or passé composé: three pairs', '| sentence | meaning |
|---|---|
| *Je **lisais** un livre.* | I was reading (in progress, no end stated) |
| *J''**ai lu** un livre.* | I read a book (finished, done) |
| *Il **pleuvait**.* | It was raining (setting) |
| *Il **a plu**.* | It rained (an event, now over) |
| *Je **connaissais** Marie.* | I knew Marie (a lasting state) |
| *J''**ai connu** Marie en 2020.* | I met Marie in 2020 (the moment we met) |

That last pair shows it best: with some verbs, changing the tense changes the verb''s meaning, not only its timing.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Imparfait ou passé composé : trois paires', '| phrase | sens |
|---|---|
| *Je **lisais** un livre.* | j''étais en train de lire (en cours, sans fin précisée) |
| *J''**ai lu** un livre.* | j''ai lu un livre (achevé) |
| *Il **pleuvait**.* | il pleuvait (décor) |
| *Il **a plu**.* | il a plu (événement désormais clos) |
| *Je **connaissais** Marie.* | je la connaissais (état durable) |
| *J''**ai connu** Marie en 2020.* | je l''ai rencontrée en 2020 (le moment de la rencontre) |

La dernière paire est la plus parlante : avec certains verbes, changer de temps change le sens du verbe, et pas seulement son moment.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'quand j''étais petit(e)', 'kɑ̃.ʒe.tɛ.p(ə).ti', 'Quand j''étais petit, j''habitais près de la mer.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'when I was little', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'expression qui introduit un souvenir d''enfance', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'jouer', 'ʒwe', 'Je jouais au football tous les dimanches.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to play', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'pratiquer un jeu ou un sport', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'il faisait froid', 'il.fə.zɛ.fʁwa', 'Il faisait froid et la rue était vide.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'it was cold', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'description du temps qu''il faisait', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'sonner', 'sɔ.ne', 'Le téléphone a sonné à minuit.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to ring', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'produire une sonnerie', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'l''enfance', 'lɑ̃.fɑ̃s', 'J''ai passé mon enfance au Salvador.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'childhood', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'période de la vie où l''on est enfant', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'à l''époque', 'a.le.pɔk', 'À l''époque, je ne parlais pas français.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'at that time', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à ce moment du passé', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'changer', 'ʃɑ̃.ʒe', 'Ma vie a changé quand je suis arrivé ici.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to change', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'devenir autre', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'avant', 'a.vɑ̃', 'Avant, je travaillais dans l''agriculture.'
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'before, previously', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à une période antérieure', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which form gives the stem of the imparfait?', 'The nous form of the present, minus -ons: nous prenons → je prenais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle forme fournit le radical de l''imparfait ?', 'La forme nous du présent, moins -ons : nous prenons → je prenais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'nous (présent)', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'l''infinitif', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'je (présent)', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which verb is irregular in the imparfait?', 'être → j''étais. It is the only irregular verb in the whole tense.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel verbe est irrégulier à l''imparfait ?', 'être → j''étais. C''est le seul verbe irrégulier de tout le temps.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'être', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'avoir', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'aller', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'faire', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Quand j''étais enfant, je ___ au football. » Which tense fits?', 'jouais — a repeated childhood habit, so the imparfait.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Quand j''étais enfant, je ___ au football. » Quel temps convient ?', 'jouais — une habitude répétée de l''enfance, donc l''imparfait.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'jouais', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'ai joué', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'joue', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je ___ quand le téléphone a sonné. » (dormir, imparfait)', 'dormais — the ongoing action is in the imparfait; the interrupting event stays in the passé composé.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je ___ quand le téléphone a sonné. » (dormir, imparfait)', 'dormais — l''action en cours se met à l''imparfait ; l''événement qui l''interrompt reste au passé composé.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'dormais'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l02-imparfait';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« J''ai connu Marie en 2020 » means:', 'I met her in 2020. « Je connaissais Marie » would describe a lasting state of acquaintance.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« J''ai connu Marie en 2020 » signifie :', 'Je l''ai rencontrée en 2020. « Je connaissais Marie » décrirait un état durable de connaissance.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je l''ai rencontrée en 2020', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je la connaissais déjà avant 2020', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je ne la connais plus', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l02-imparfait' AND e.position = 5;

-- ------------------------------------------------------------------
-- Leçon 3 : Poser des questions
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l03-poser-des-questions', 3, 30, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Asking questions', 'Three ways to ask, and the question words that get you real answers.', 'Can ask and answer simple questions on familiar topics and immediate needs.'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Poser des questions', 'Trois façons de questionner, et les mots interrogatifs qui obtiennent de vraies réponses.', 'Peut poser des questions simples sur des sujets familiers et des besoins immédiats, et y répondre.'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=pNYGtFmrgDo', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Three registers, one question', 'French has three ways of asking the same thing, and they differ in register, not in meaning:

| register | form | example |
|---|---|---|
| spoken, informal | intonation only | *Tu viens ?* |
| neutral, all situations | est-ce que | *Est-ce que tu viens ?* |
| formal, written | inversion | *Viens-tu ?* |

**est-ce que** is the safest: it works everywhere, in speech and in writing, and it requires no change in word order. If you learn only one, learn that one.

With inversion and a third-person verb ending in a vowel, a **-t-** appears to ease pronunciation: *A-t-il compris ?*, *Où va-t-elle ?*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Trois registres, une même question', 'Le français dispose de trois façons de poser la même question, qui diffèrent par le registre, non par le sens :

| registre | forme | exemple |
|---|---|---|
| oral, familier | intonation seule | *Tu viens ?* |
| neutre, toutes situations | est-ce que | *Est-ce que tu viens ?* |
| soutenu, écrit | inversion | *Viens-tu ?* |

**est-ce que** est la forme la plus sûre : elle fonctionne partout, à l''oral comme à l''écrit, et n''impose aucun changement d''ordre des mots. Si vous n''en retenez qu''une, retenez celle-là.

Avec l''inversion et un verbe de troisième personne terminé par une voyelle, un **-t-** apparaît pour faciliter la prononciation : *A-t-il compris ?*, *Où va-t-elle ?*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=be56WdKPuk0', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Question words', '| word | asks about | example |
|---|---|---|
| **qui** | a person | *Qui est-ce ?* |
| **que / qu''est-ce que** | a thing | *Qu''est-ce que c''est ?* |
| **où** | a place | *Où habitez-vous ?* |
| **quand** | a time | *Quand arrive le train ?* |
| **comment** | a manner | *Comment allez-vous ?* |
| **pourquoi** | a reason | *Pourquoi ?* — answer with *parce que* |
| **combien** | a quantity | *Combien ça coûte ?* |
| **quel / quelle** | which one | *Quelle heure est-il ?* |

**quel** is an adjective and agrees: quel, quelle, quels, quelles — *Quel âge avez-vous ?*, *Quelles langues parlez-vous ?*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les mots interrogatifs', '| mot | porte sur | exemple |
|---|---|---|
| **qui** | une personne | *Qui est-ce ?* |
| **que / qu''est-ce que** | une chose | *Qu''est-ce que c''est ?* |
| **où** | un lieu | *Où habitez-vous ?* |
| **quand** | un moment | *Quand arrive le train ?* |
| **comment** | une manière | *Comment allez-vous ?* |
| **pourquoi** | une cause | *Pourquoi ?* — on répond par *parce que* |
| **combien** | une quantité | *Combien ça coûte ?* |
| **quel / quelle** | un choix parmi plusieurs | *Quelle heure est-il ?* |

**quel** est un adjectif et s''accorde : quel, quelle, quels, quelles — *Quel âge avez-vous ?*, *Quelles langues parlez-vous ?*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Questions that solve real problems', 'Keep these ready. Each one has got someone out of trouble:

- *Excusez-moi, je ne comprends pas. Pouvez-vous répéter plus lentement ?*
- *Qu''est-ce que je dois faire maintenant ?*
- *Quels documents faut-il apporter ?*
- *Où est-ce que je peux trouver ce formulaire ?*
- *Combien de temps ça prend ?*
- *Est-ce qu''il y a quelqu''un qui parle anglais ou espagnol ?*
- *Pouvez-vous me l''écrire, s''il vous plaît ?* — the most useful of all: written down, you can check it later.

Asking a question is not a sign of weak French. Not asking is what leaves you with the wrong document and another two-month wait.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les questions qui débloquent une situation', 'Gardez ces phrases prêtes. Chacune a déjà tiré quelqu''un d''affaire :

- *Excusez-moi, je ne comprends pas. Pouvez-vous répéter plus lentement ?*
- *Qu''est-ce que je dois faire maintenant ?*
- *Quels documents faut-il apporter ?*
- *Où est-ce que je peux trouver ce formulaire ?*
- *Combien de temps ça prend ?*
- *Est-ce qu''il y a quelqu''un qui parle anglais ou espagnol ?*
- *Pouvez-vous me l''écrire, s''il vous plaît ?* — la plus utile de toutes : une fois écrit, on peut le vérifier plus tard.

Poser une question n''est pas un signe de français faible. C''est le fait de ne pas poser de question qui vous laisse avec le mauvais document et deux mois d''attente supplémentaires.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'est-ce que', 'ɛs.kə', 'Est-ce que le bureau est ouvert ?'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', '(marks a question)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'formule qui introduit une question, tous registres', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'pourquoi', 'puʁ.kwa', 'Pourquoi le dossier est-il refusé ?'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'why', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'pour quelle raison', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'parce que', 'paʁs.kə', 'Parce qu''il manque un justificatif.'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'because', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'introduit la cause, en réponse à pourquoi', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'combien', 'kɔ̃.bjɛ̃', 'Combien de temps ça prend ?'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'how much, how many', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'quelle quantité', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'quel / quelle', 'kɛl', 'Quels documents faut-il apporter ?'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'which, what', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'adjectif interrogatif, il s''accorde', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'comment', 'kɔ.mɑ̃', 'Comment ça marche ?'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'how', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'de quelle manière', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'un formulaire', 'fɔʁ.my.lɛʁ', 'Où est-ce que je trouve ce formulaire ?'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a form', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'document à remplir', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'un dossier', 'do.sje', 'Mon dossier est incomplet.'
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a file, an application', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ensemble de documents d''une démarche', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which form works in every register?', 'Est-ce que tu viens ? — neutral, usable in speech and writing alike.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle forme convient dans tous les registres ?', 'Est-ce que tu viens ? — neutre, utilisable aussi bien à l''oral qu''à l''écrit.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Est-ce que tu viens ?', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Tu viens ?', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Viens-tu ?', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « ___ âge avez-vous ? »', 'Quel — âge is masculine singular, and quel agrees with the noun that follows.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « ___ âge avez-vous ? »', 'Quel — âge est masculin singulier, et quel s''accorde avec le nom qui suit.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Quel', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Quelle', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Quels', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'Combien', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which word introduces the answer to « pourquoi ? »', 'parce que — Pourquoi est-il absent ? Parce qu''il est malade.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel mot introduit la réponse à « pourquoi ? »', 'parce que — Pourquoi est-il absent ? Parce qu''il est malade.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'parce que', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'pour que', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'par ce que', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Ask which documents you must bring (use « quels »).', 'Quels documents faut-il apporter ? — one of the most useful questions at any counter.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Demandez quels documents il faut apporter (employez « quels »).', 'Quels documents faut-il apporter ? — l''une des questions les plus utiles à tout guichet.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'quels documents faut-il apporter'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'quels documents est-ce qu''il faut apporter'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'quels documents je dois apporter'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l03-poser-des-questions';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In « Où va-t-elle ? », the -t- has a meaning of its own.', 'False. It is purely phonetic, inserted to avoid two vowels meeting in va-elle.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dans « Où va-t-elle ? », le -t- a un sens propre.', 'Faux. Il est purement phonétique : il évite la rencontre de deux voyelles dans va-elle.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l03-poser-des-questions' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 4 : Comparer
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l04-comparer', 4, 30, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Comparing things', 'Plus, moins, aussi — and the two irregular forms everyone trips over.', 'Can compare people, places and things in simple sentences.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Comparer', 'Plus, moins, aussi — et les deux formes irrégulières qui piègent tout le monde.', 'Peut comparer des personnes, des lieux et des objets en phrases simples.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=IRSc4LERH08', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The comparative', 'One pattern covers everything: **plus / moins / aussi + adjective + que**.

- *Lyon est **plus grand que** Dijon.* — bigger than
- *Ce logement est **moins cher que** l''autre.* — less expensive than
- *Le train est **aussi rapide que** l''avion.* — as fast as

With a **noun**, add *de*: *j''ai **plus de** travail **que** l''année dernière*.
With a **verb**, nothing extra: *je travaille **plus que** toi*.

Two irregular forms must be memorised:
- bon → **meilleur** (*ce café est meilleur*), never *plus bon*
- bien → **mieux** (*je parle mieux qu''avant*), never *plus bien*

The pair *meilleur / mieux* mirrors *bon / bien*: one qualifies a noun, the other a verb.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le comparatif', 'Un seul schéma couvre tout : **plus / moins / aussi + adjectif + que**.

- *Lyon est **plus grand que** Dijon.*
- *Ce logement est **moins cher que** l''autre.*
- *Le train est **aussi rapide que** l''avion.*

Avec un **nom**, on ajoute *de* : *j''ai **plus de** travail **que** l''année dernière*.
Avec un **verbe**, rien de plus : *je travaille **plus que** toi*.

Deux formes irrégulières sont à mémoriser :
- bon → **meilleur** (*ce café est meilleur*), jamais *plus bon*
- bien → **mieux** (*je parle mieux qu''avant*), jamais *plus bien*

Le couple *meilleur / mieux* reflète *bon / bien* : l''un qualifie un nom, l''autre un verbe.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'GRAMMAR', 'https://www.youtube.com/watch?v=rgijX12RpP8', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The superlative', 'Add the definite article to the comparative: **le / la / les plus (or moins) + adjective**.

- *C''est **le plus grand** musée de la ville.*
- *C''est **la moins chère** des solutions.*
- *Ce sont **les plus belles** photos.*

After a superlative, the group is introduced by **de**, where English uses *in*: *le plus grand musée **de** la ville* — the biggest museum **in** the city.

Irregular again: bon → **le meilleur**, bien → **le mieux**.
- *C''est **le meilleur** restaurant du quartier.*
- *C''est lui qui parle **le mieux**.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le superlatif', 'On ajoute l''article défini au comparatif : **le / la / les plus (ou moins) + adjectif**.

- *C''est **le plus grand** musée de la ville.*
- *C''est **la moins chère** des solutions.*
- *Ce sont **les plus belles** photos.*

Après un superlatif, le groupe est introduit par **de**, là où l''anglais emploie *in* : *le plus grand musée **de** la ville*.

Irrégularités à nouveau : bon → **le meilleur**, bien → **le mieux**.
- *C''est **le meilleur** restaurant du quartier.*
- *C''est lui qui parle **le mieux**.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Useful comparisons in daily life', '- *Le bus est **moins cher que** le train, mais il est **plus lent**.*
- *Cet appartement est **plus petit**, mais il est **mieux** situé.*
- *Le loyer est **aussi élevé qu''**à Paris.*
- *C''est **le moyen le plus rapide** d''obtenir un rendez-vous.*
- *Mon français est **meilleur qu''**il y a six mois.*

That last sentence is worth saying out loud from time to time. Progress in a language is invisible day to day and obvious over six months.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Des comparaisons utiles au quotidien', '- *Le bus est **moins cher que** le train, mais il est **plus lent**.*
- *Cet appartement est **plus petit**, mais il est **mieux** situé.*
- *Le loyer est **aussi élevé qu''**à Paris.*
- *C''est **le moyen le plus rapide** d''obtenir un rendez-vous.*
- *Mon français est **meilleur qu''**il y a six mois.*

Cette dernière phrase mérite d''être dite à voix haute de temps en temps. En langue, le progrès est invisible au jour le jour et évident sur six mois.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'plus … que', 'ply.kə', 'Lyon est plus grand que Dijon.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'more … than', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'marque la supériorité', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'moins … que', 'mwɛ̃.kə', 'Ce logement est moins cher que l''autre.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'less … than', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'marque l''infériorité', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'aussi … que', 'o.si.kə', 'Le train est aussi rapide que l''avion.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'as … as', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'marque l''égalité', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'meilleur(e)', 'mɛ.jœʁ', 'Ce café est meilleur que l''autre.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'better (adjective)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'comparatif irrégulier de bon', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'mieux', 'mjø', 'Je parle mieux qu''avant.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'better (adverb)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'comparatif irrégulier de bien', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'rapide / lent(e)', 'ʁa.pid / lɑ̃', 'Le bus est plus lent mais moins cher.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'fast / slow', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui va vite / qui va doucement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'presque', 'pʁɛsk', 'C''est presque le même prix.'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'almost', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'à peu près, pas tout à fait', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'la différence', 'di.fe.ʁɑ̃s', 'Quelle est la différence entre les deux ?'
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the difference', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ce qui distingue deux choses', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Ce café est ___ que l''autre. »', 'meilleur — the irregular comparative of bon. « Plus bon » does not exist.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Ce café est ___ que l''autre. »', 'meilleur — le comparatif irrégulier de bon. « Plus bon » n''existe pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'meilleur', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'plus bon', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'mieux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Je parle ___ qu''avant. »', 'mieux — it modifies the verb parler, so the adverb form is required, not meilleur.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Je parle ___ qu''avant. »', 'mieux — il modifie le verbe parler : c''est la forme adverbiale qui s''impose, non meilleur.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'mieux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'meilleur', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'plus bien', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''ai ___ travail que l''année dernière. »', 'plus de — before a noun, the comparative takes de.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''ai ___ travail que l''année dernière. »', 'plus de — devant un nom, le comparatif prend de.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'plus de', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'plus', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'plus que', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « C''est ___ ___ ___ musée de la ville. » (the biggest)', 'le plus grand — a superlative is the definite article plus the comparative.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « C''est ___ ___ ___ musée de la ville. » (le plus grand)', 'le plus grand — le superlatif est l''article défini ajouté au comparatif.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'le plus grand'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l04-comparer';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'After a superlative, French uses « dans » : le plus grand musée dans la ville.', 'False. French uses de: le plus grand musée de la ville. Dans here is an English interference.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Après un superlatif, le français emploie « dans » : le plus grand musée dans la ville.', 'Faux. Le français emploie de : le plus grand musée de la ville. Dans est ici un calque de l''anglais.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l04-comparer' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 5 : Regarder un film en français
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l05-comprehension-film', 5, 40, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Watching a film in French', 'Turn screen time into study time, with a method and the right subtitles.', 'Can follow the main thread of a simple audiovisual document with visual support.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Regarder un film en français', 'Transformer le temps d''écran en temps d''étude, avec une méthode et les bons sous-titres.', 'Peut suivre le fil principal d''un document audiovisuel simple avec un appui visuel.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'MEDIA', 'https://www.youtube.com/watch?v=00Ioe6R6ZwE', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The subtitle question', '| subtitles | effect | when to use |
|---|---|---|
| in your language | you read, you do not listen | almost never |
| **in French** | you link sound to spelling | **most of the time** |
| none | maximum effort, maximum progress | on a rewatch |

The most effective sequence for a single film:

1. **First viewing with French subtitles.** Follow the story. Do not stop.
2. **Pick one scene of two or three minutes.** Watch it three times: with subtitles, without, with again.
3. **Write down five expressions** you heard more than once.

French subtitles are not a crutch. They are what connects the sound [ʒənəsɛpa] to the written *je ne sais pas* — the single biggest obstacle in learning this language.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'La question des sous-titres', '| sous-titres | effet | quand les employer |
|---|---|---|
| dans votre langue | on lit, on n''écoute pas | presque jamais |
| **en français** | on relie le son à l''orthographe | **la plupart du temps** |
| aucun | effort maximal, progrès maximal | lors d''un second visionnage |

La séquence la plus efficace pour un même film :

1. **Premier visionnage avec sous-titres français.** Suivez l''histoire. N''arrêtez pas.
2. **Choisissez une scène de deux ou trois minutes.** Regardez-la trois fois : avec sous-titres, sans, puis de nouveau avec.
3. **Notez cinq expressions** entendues plus d''une fois.

Les sous-titres français ne sont pas une béquille : ce sont eux qui relient le son [ʒənəsɛpa] à la graphie *je ne sais pas* — le principal obstacle de l''apprentissage de cette langue.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Talking about a film', 'un film · une scène · un personnage · l''histoire · l''acteur / l''actrice · le réalisateur · la bande-annonce · les sous-titres · la version originale (VO)

Giving an opinion — the whole point of watching:
- *J''ai bien aimé, surtout la fin.*
- *Je n''ai pas tout compris, mais j''ai suivi l''histoire.*
- *Le personnage principal est très attachant.*
- *C''était un peu long.*
- *Je le recommande.*

At A1 you are not expected to analyse a film. You are expected to say whether you liked it and why, in two sentences.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Parler d''un film', 'un film · une scène · un personnage · l''histoire · l''acteur / l''actrice · le réalisateur · la bande-annonce · les sous-titres · la version originale (VO)

Donner son avis — tout l''intérêt de l''exercice :
- *J''ai bien aimé, surtout la fin.*
- *Je n''ai pas tout compris, mais j''ai suivi l''histoire.*
- *Le personnage principal est très attachant.*
- *C''était un peu long.*
- *Je le recommande.*

Au niveau A1, on n''attend pas de vous une analyse. On attend que vous disiez si le film vous a plu et pourquoi, en deux phrases.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Where to watch for free', '- **Your local library** — free membership in most French towns, with a DVD collection and often access to a streaming platform included.
- **Public broadcasters** — France.tv and Arte offer free catch-up, much of it subtitled in French.
- **TV5MONDE Apprendre** — free graded video exercises, sorted by CEFR level. Start at A1, not at B1.
- **YouTube** — short films and channels for learners; search *court métrage sous-titré français*.

A short film of ten minutes, watched three times, teaches more than a two-hour film watched once.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Où regarder gratuitement', '- **Votre bibliothèque municipale** — inscription gratuite dans la plupart des villes, avec un fonds de DVD et souvent l''accès inclus à une plateforme de streaming.
- **Les chaînes publiques** — France.tv et Arte proposent un rattrapage gratuit, largement sous-titré en français.
- **TV5MONDE Apprendre** — exercices vidéo gratuits, classés par niveau du CECR. Commencez au niveau A1, pas au B1.
- **YouTube** — courts métrages et chaînes pour apprenants ; cherchez *court métrage sous-titré français*.

Un court métrage de dix minutes, regardé trois fois, apprend davantage qu''un film de deux heures vu une seule fois.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'un film', 'film', 'J''ai regardé un film français hier soir.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a film, a movie', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'œuvre de cinéma', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'les sous-titres', 'su.titʁ', 'Je regarde avec les sous-titres en français.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'subtitles', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'texte affiché en bas de l''écran', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'une scène', 'sɛn', 'J''ai revu cette scène trois fois.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a scene', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'partie d''un film ou d''une pièce', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'un personnage', 'pɛʁ.sɔ.naʒ', 'Le personnage principal est une femme.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a character', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'personne représentée dans une fiction', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'la fin', 'fɛ̃', 'Je n''ai pas aimé la fin.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the end, the ending', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'moment où quelque chose se termine', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'recommander', 'ʁə.kɔ.mɑ̃.de', 'Je vous le recommande vraiment.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to recommend', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'conseiller vivement', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'gratuit(e)', 'ɡʁa.tɥi', 'L''inscription à la bibliothèque est gratuite.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'free of charge', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui ne coûte rien', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'en version originale', 'ɑ̃.vɛʁ.sjɔ̃.ɔ.ʁi.ʒi.nal', 'Je préfère les films en version originale.'
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'in the original language', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'sans doublage, dans la langue de tournage', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which subtitles help a French learner most?', 'French subtitles: they link what you hear to how it is written, which is the hardest step in French.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quels sous-titres aident le plus un apprenant de français ?', 'Les sous-titres français : ils relient ce que l''on entend à la façon dont cela s''écrit, l''étape la plus difficile en français.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'En français', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Dans votre langue maternelle', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Aucun, dès le début', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'What does « en version originale » mean?', 'In the language it was filmed in, without dubbing. Cinemas mark it VO or VOST when subtitled.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Que signifie « en version originale » ?', 'Dans la langue de tournage, sans doublage. Les cinémas l''indiquent par VO, ou VOST lorsque le film est sous-titré.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Dans la langue de tournage, sans doublage', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Avec des sous-titres obligatoires', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'La première version du film', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which approach is most effective?', 'A ten-minute short watched three times. Repetition on a short passage beats one pass on a long film.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle approche est la plus efficace ?', 'Un court métrage de dix minutes vu trois fois. La répétition sur un extrait court vaut mieux qu''un seul passage sur un long film.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Un court métrage de dix minutes, vu trois fois', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Un film de deux heures, vu une fois', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Une série entière en un week-end', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Give your opinion: say you liked the film, especially the ending.', 'J''ai bien aimé le film, surtout la fin. « Surtout » is the simplest way to point to what you liked most.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Donnez votre avis : dites que vous avez bien aimé le film, surtout la fin.', 'J''ai bien aimé le film, surtout la fin. « Surtout » est la façon la plus simple de désigner ce qui a le plus plu.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'j''ai bien aimé le film surtout la fin'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'jai bien aime le film surtout la fin'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'j''ai bien aimé surtout la fin'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l05-comprehension-film';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You must understand every word of a film for the session to be useful.', 'False. Following the thread and picking up a handful of expressions is a successful session at A1.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Il faut comprendre chaque mot d''un film pour que la séance soit utile.', 'Faux. Suivre le fil et relever quelques expressions constitue une séance réussie au niveau A1.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l05-comprehension-film' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 6 : Les cinq sens
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l06-les-cinq-sens', 6, 30, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'The five senses', 'Voir, entendre, sentir, goûter, toucher — and how to describe what you perceive.', 'Can describe sensations and give a simple opinion about food and surroundings.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Les cinq sens', 'Voir, entendre, sentir, goûter, toucher — et comment décrire ce que l''on perçoit.', 'Peut décrire des sensations et donner un avis simple sur la nourriture et son environnement.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=9f7t_Y9jw_8', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The five verbs', '| | voir | entendre | sentir |
|---|---|---|---|
| je | vois | entends | sens |
| tu | vois | entends | sens |
| il / elle | voit | entend | sent |
| nous | voyons | entendons | sentons |
| vous | voyez | entendez | sentez |
| ils / elles | voient | entendent | sentent |

*goûter* and *toucher* are regular -er verbs: je goûte, je touche.

French distinguishes involuntary perception from deliberate attention, exactly as English does:

| perceive | pay attention |
|---|---|
| voir | regarder |
| entendre | écouter |

*J''entends la radio* (it is on) versus *j''écoute la radio* (I am following it).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les cinq verbes', '| | voir | entendre | sentir |
|---|---|---|---|
| je | vois | entends | sens |
| tu | vois | entends | sens |
| il / elle | voit | entend | sent |
| nous | voyons | entendons | sentons |
| vous | voyez | entendez | sentez |
| ils / elles | voient | entendent | sentent |

*goûter* et *toucher* sont des verbes réguliers en -er : je goûte, je touche.

Le français distingue la perception involontaire de l''attention volontaire :

| percevoir | prêter attention |
|---|---|
| voir | regarder |
| entendre | écouter |

*J''entends la radio* (elle est allumée) contre *j''écoute la radio* (je la suis).'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', 'https://www.youtube.com/watch?v=joVL2-ZugdE', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Describing a sensation', '**Taste** — sucré (sweet), salé (salty), amer (bitter), acide (sour), épicé (spicy), fade (bland)
**Smell** — ça sent bon / mauvais, une odeur, un parfum
**Sound** — fort, doux, bruyant, silencieux
**Touch** — chaud, froid, doux, dur, mou
**Sight** — clair, sombre, propre, sale

**sentir** does triple duty, and context decides:
- *Je sens une odeur de café.* — I smell coffee.
- *Ça sent bon !* — That smells good!
- *Je me sens fatigué.* — I feel tired.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Décrire une sensation', '**Le goût** — sucré, salé, amer, acide, épicé, fade
**L''odorat** — ça sent bon / mauvais, une odeur, un parfum
**L''ouïe** — fort, doux, bruyant, silencieux
**Le toucher** — chaud, froid, doux, dur, mou
**La vue** — clair, sombre, propre, sale

**sentir** assure trois emplois, que le contexte distingue :
- *Je sens une odeur de café.*
- *Ça sent bon !*
- *Je me sens fatigué.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'At the table', 'Meals matter socially in France, and a few phrases carry a lot of goodwill:

- **Bon appétit !** — said before starting, to everyone at the table
- **C''est délicieux.** — safe, warm, always welcome
- **Je n''ai plus faim, merci.** — how to decline a second helping politely
- **Je suis végétarien(ne).** / **Je ne mange pas de porc.** — clear and unembarrassed
- **Santé !** — when glasses are raised

Refusing a dish is not impolite; refusing without a word is. One short sentence is enough.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'À table', 'Le repas a en France une forte valeur sociale, et quelques phrases y font beaucoup :

- **Bon appétit !** — avant de commencer, à l''adresse de toute la table
- **C''est délicieux.** — simple, chaleureux, toujours bienvenu
- **Je n''ai plus faim, merci.** — pour refuser poliment une seconde portion
- **Je suis végétarien(ne).** / **Je ne mange pas de porc.** — clair et sans gêne
- **Santé !** — au moment de trinquer

Refuser un plat n''est pas impoli ; refuser sans un mot l''est. Une phrase courte suffit.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'voir', 'vwaʁ', 'Je ne vois pas bien de loin.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to see', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'percevoir par les yeux', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'entendre', 'ɑ̃.tɑ̃dʁ', 'J''entends du bruit dans la rue.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to hear', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'percevoir par les oreilles', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'sentir', 'sɑ̃.tiʁ', 'Ça sent bon dans la cuisine.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to smell; to feel', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'percevoir une odeur ; éprouver une sensation', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'goûter', 'ɡu.te', 'Vous voulez goûter ?'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to taste', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'percevoir la saveur d''un aliment', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'toucher', 'tu.ʃe', 'Ne touchez pas, c''est chaud.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to touch', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'mettre en contact avec la main', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'sucré / salé', 'sy.kʁe / sa.le', 'Je préfère le salé au sucré.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'sweet / salty', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui a le goût du sucre / du sel', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'bruyant(e)', 'bʁɥi.jɑ̃', 'Le quartier est bruyant la nuit.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'noisy', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui fait beaucoup de bruit', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'délicieux / délicieuse', 'de.li.sjø', 'C''est délicieux, merci beaucoup.'
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'delicious', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'très bon au goût', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which verb expresses deliberate attention?', 'écouter. Entendre is passive perception: you hear the radio without following it.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quel verbe exprime une attention volontaire ?', 'écouter. Entendre relève de la perception passive : on entend la radio sans la suivre.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'écouter', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'entendre', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'sentir', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Je me sens fatigué » means:', 'I feel tired. Used reflexively, sentir describes one''s own state.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Je me sens fatigué » signifie :', 'J''éprouve de la fatigue. Employé à la forme pronominale, sentir décrit son propre état.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'J''éprouve de la fatigue', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je sens une odeur', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je touche quelque chose', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Nous ___ la mer depuis la fenêtre. » (voir)', 'voyons — voir has an irregular nous form with a y.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Nous ___ la mer depuis la fenêtre. » (voir)', 'voyons — voir présente une forme nous irrégulière, avec un y.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'voyons', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'voions', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'voient', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You are offered a dish you do not eat. Say politely that you do not eat pork.', 'je ne mange pas de porc — remember that after a negation the partitive becomes de.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'On vous propose un plat que vous ne mangez pas. Dites poliment que vous ne mangez pas de porc.', 'je ne mange pas de porc — rappelez-vous qu''après une négation, le partitif devient de.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je ne mange pas de porc'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je ne mange pas de porc merci'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l06-les-cinq-sens';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Bon appétit » is said at the end of a meal.', 'False. It is said before starting, to everyone at the table.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Bon appétit » se dit à la fin du repas.', 'Faux. On le dit avant de commencer, à l''adresse de toute la table.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l06-les-cinq-sens' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 7 : La musique francophone
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l07-musique-francophone', 7, 30, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'French-speaking music', 'Songs train your ear while you are not trying — the least tiring way to learn.', 'Can recognise familiar words and basic phrases in songs and short spoken texts.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'La musique francophone', 'La chanson entraîne l''oreille sans effort conscient — la manière la moins fatigante d''apprendre.', 'Peut reconnaître des mots familiers et des expressions courantes dans des chansons et de courts textes oraux.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'CULTURE', 'https://www.youtube.com/watch?v=5NjJLFI_oYs', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Why songs work', 'Three reasons a song teaches more than its three minutes suggest:

1. **Repetition without boredom.** You will replay a song you like twenty times. No exercise survives twenty repetitions.
2. **Melody carries memory.** Words attached to a tune are stored differently, and come back years later.
3. **Rhythm teaches liaison.** Songs make audible the way French words run together — *j''ai* + *envie* becomes [ʒɛ.jɑ̃.vi] — which a textbook cannot show.

Method: listen once for pleasure, once reading the lyrics, once singing along. Fifteen minutes total, and the chorus stays for good.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Pourquoi la chanson fonctionne', 'Trois raisons pour lesquelles une chanson apprend plus que ne le laissent croire ses trois minutes :

1. **La répétition sans ennui.** On réécoute vingt fois une chanson que l''on aime. Aucun exercice ne survit à vingt répétitions.
2. **La mélodie porte la mémoire.** Les mots associés à un air se stockent autrement et reviennent des années plus tard.
3. **Le rythme enseigne la liaison.** La chanson rend audible la façon dont les mots s''enchaînent — *j''ai* + *envie* donne [ʒɛ.jɑ̃.vi] — ce qu''aucun manuel ne montre.

Méthode : une écoute pour le plaisir, une avec les paroles sous les yeux, une en chantant. Quinze minutes en tout, et le refrain reste acquis.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Where to start', 'Music in French goes far beyond France, and the accents vary as much as the styles:

| register | what you get |
|---|---|
| **la chanson française** (Brel, Barbara, Brassens) | clear diction, rich vocabulary, slow enough to follow |
| **la pop actuelle** (Videoclub, Therapie Taxi, Angèle) | everyday spoken French, current expressions |
| **le rap francophone** | fast, dense, full of idiom — leave it for later, but it is where the living language is |
| **la musique africaine francophone** (Tiken Jah Fakoly, Youssoupha) | other accents and rhythms of the same language |
| **le Québec** (Cœur de pirate, Les Cowboys Fringants) | a different accent, and a good ear-training challenge |

Start with something slow enough that you can catch the chorus. Enjoyment is the only thing that guarantees the twenty repetitions.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Par où commencer', 'La musique en français dépasse largement la France, et les accents y varient autant que les styles :

| registre | ce qu''on y gagne |
|---|---|
| **la chanson française** (Brel, Barbara, Brassens) | diction claire, vocabulaire riche, débit suivable |
| **la pop actuelle** (Videoclub, Therapie Taxi, Angèle) | français parlé d''aujourd''hui, expressions courantes |
| **le rap francophone** | rapide, dense, très idiomatique — à garder pour plus tard, mais c''est là que vit la langue |
| **la musique africaine francophone** (Tiken Jah Fakoly, Youssoupha) | d''autres accents et d''autres rythmes de la même langue |
| **le Québec** (Cœur de pirate, Les Cowboys Fringants) | un accent différent, excellent entraînement de l''oreille |

Commencez par un morceau assez lent pour que le refrain s''attrape. Le plaisir est la seule chose qui garantisse les vingt réécoutes.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Talking about music', 'une chanson · les paroles · le refrain · un chanteur / une chanteuse · un groupe · un album · écouter · chanter

Giving an opinion:
- *J''aime beaucoup cette chanson.*
- *Les paroles sont belles.*
- *Je ne comprends pas tout, mais j''aime la mélodie.*
- *Tu connais ce groupe ?*
- *Qu''est-ce que tu écoutes en ce moment ?*

That last question is one of the easiest ways to start a conversation with a French speaker — it asks for an opinion, not information, so the other person does most of the talking.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Parler de musique', 'une chanson · les paroles · le refrain · un chanteur / une chanteuse · un groupe · un album · écouter · chanter

Donner son avis :
- *J''aime beaucoup cette chanson.*
- *Les paroles sont belles.*
- *Je ne comprends pas tout, mais j''aime la mélodie.*
- *Tu connais ce groupe ?*
- *Qu''est-ce que tu écoutes en ce moment ?*

Cette dernière question est l''un des moyens les plus simples d''engager la conversation avec un francophone : elle demande un avis, non une information, et c''est l''autre qui parle le plus.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'une chanson', 'ʃɑ̃.sɔ̃', 'Cette chanson passe partout en ce moment.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a song', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'morceau de musique avec des paroles', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'les paroles', 'pa.ʁɔl', 'Je cherche les paroles sur internet.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the lyrics', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'le texte d''une chanson', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'le refrain', 'ʁə.fʁɛ̃', 'Je connais seulement le refrain.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'the chorus', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'partie qui se répète dans une chanson', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'un chanteur / une chanteuse', 'ʃɑ̃.tœʁ / ʃɑ̃.tøz', 'C''est une chanteuse québécoise.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a singer', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'personne qui chante', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'un groupe', 'ɡʁup', 'Tu connais ce groupe français ?'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a band, a group', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ensemble de musiciens', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'chanter', 'ʃɑ̃.te', 'Je chante en français sous la douche.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to sing', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'produire une mélodie avec la voix', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'une mélodie', 'me.lɔ.di', 'La mélodie est très douce.'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a melody, a tune', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'suite de notes qui forme un air', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'en ce moment', 'ɑ̃.sə.mɔ.mɑ̃', 'Qu''est-ce que tu écoutes en ce moment ?'
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'at the moment', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'actuellement, ces jours-ci', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'What is « le refrain » of a song?', 'The part that comes back between verses — and the easiest part to learn first.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Qu''est-ce que « le refrain » d''une chanson ?', 'La partie qui revient entre les couplets — et la plus facile à apprendre en premier.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'La partie qui se répète', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Le titre de la chanson', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Le nom du chanteur', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Why is a song effective for learning?', 'Because it invites repetition without boredom — the one condition no classic exercise meets.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Pourquoi la chanson est-elle efficace pour apprendre ?', 'Parce qu''elle appelle la répétition sans ennui — la condition qu''aucun exercice classique ne remplit.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Elle se réécoute sans lasser', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Elle emploie un vocabulaire simple', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Elle évite les liaisons', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Which music comes from a French-speaking region outside Europe?', 'Quebec. French is sung across Africa, the Caribbean and Canada, each with its own accent.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Quelle musique vient d''une région francophone hors d''Europe ?', 'Le Québec. Le français se chante en Afrique, aux Antilles et au Canada, chaque fois avec son accent.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'La musique québécoise', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'La chanson française classique', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'La pop belge', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Ask someone what they are listening to at the moment.', 'Qu''est-ce que tu écoutes en ce moment ? — an easy conversation opener, because it asks for an opinion.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Demandez à quelqu''un ce qu''il écoute en ce moment.', 'Qu''est-ce que tu écoutes en ce moment ? — une entrée en conversation facile, puisqu''elle demande un avis.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'qu''est-ce que tu écoutes en ce moment'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'quest-ce que tu ecoutes en ce moment'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'qu''est-ce que vous écoutez en ce moment'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l07-musique-francophone';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You should start with rap, because it is the most current French.', 'False. Rap is fast and heavily idiomatic. Start with something slow enough to catch the chorus, and come back to rap later.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Il vaut mieux commencer par le rap, puisque c''est le français le plus actuel.', 'Faux. Le rap est rapide et très idiomatique. Commencez par un morceau assez lent pour attraper le refrain, et gardez le rap pour plus tard.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l07-musique-francophone' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 8 : La négation et les voyelles nasales
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l08-negation-et-nasales', 8, 35, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Negation and nasal vowels', 'Saying no in French takes two words — and hearing the difference takes your nose.', 'Can form negative sentences correctly and distinguish the French nasal vowels.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'La négation et les voyelles nasales', 'Dire non en français demande deux mots — et entendre la différence passe par le nez.', 'Peut construire correctement des phrases négatives et distinguer les voyelles nasales du français.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=ygO9WmfZUyA', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Negation surrounds the verb', 'French negation has two parts: **ne … pas**, wrapped around the conjugated verb.

- *Je **ne** parle **pas** allemand.*
- *Il **n''**est **pas** là.* (ne → n'' before a vowel)
- *Je **n''**ai **pas** compris.* (passé composé: around the auxiliary)
- *Je **ne** vais **pas** travailler.* (near future: around aller)

Other negative pairs follow the same shape:

| | meaning |
|---|---|
| ne … jamais | never |
| ne … plus | no longer, not any more |
| ne … rien | nothing |
| ne … personne | nobody |
| ne … pas encore | not yet |

- *Je **ne** fume **plus**.* — I don''t smoke any more.
- *Il **n''**y a **personne**.* — There is nobody.

And remember from Unit 1: after a negation, *du, de la, des* all collapse into **de** — *je n''ai pas **de** travail*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'La négation encadre le verbe', 'La négation française comporte deux éléments : **ne … pas**, qui encadrent le verbe conjugué.

- *Je **ne** parle **pas** allemand.*
- *Il **n''**est **pas** là.* (ne → n'' devant une voyelle)
- *Je **n''**ai **pas** compris.* (passé composé : autour de l''auxiliaire)
- *Je **ne** vais **pas** travailler.* (futur proche : autour d''aller)

Les autres couples négatifs suivent la même forme :

| | sens |
|---|---|
| ne … jamais | à aucun moment |
| ne … plus | la chose a cessé |
| ne … rien | aucune chose |
| ne … personne | aucune personne |
| ne … pas encore | cela n''a pas encore eu lieu |

- *Je **ne** fume **plus**.*
- *Il **n''**y a **personne**.*

Et rappelez-vous l''unité 1 : après une négation, *du, de la, des* deviennent tous **de** — *je n''ai pas **de** travail*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'PRONUNCIATION', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The spoken « ne » that disappears', 'In everyday speech, French speakers drop the **ne** almost systematically:

| written | spoken |
|---|---|
| Je ne sais pas. | *J''sais pas.* [ʃɛpa] |
| Il n''y a pas de problème. | *Y a pas de problème.* |
| Je ne comprends pas. | *J''comprends pas.* |

You must **recognise** this — otherwise half of spoken French sounds like it means the opposite. But keep writing the **ne**: dropping it in an email or a form is a clear register mistake.

The practical consequence: when listening, the word that carries the negation is **pas**, not *ne*. Train your ear on *pas*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le « ne » qui disparaît à l''oral', 'Dans la langue courante, les francophones suppriment le **ne** de façon quasi systématique :

| écrit | oral |
|---|---|
| Je ne sais pas. | *J''sais pas.* [ʃɛpa] |
| Il n''y a pas de problème. | *Y a pas de problème.* |
| Je ne comprends pas. | *J''comprends pas.* |

Il faut **reconnaître** ce phénomène, faute de quoi la moitié du français parlé semble dire le contraire de ce qu''il dit. Mais continuez d''écrire le **ne** : l''omettre dans un courriel ou un formulaire est une faute de registre manifeste.

Conséquence pratique : à l''écoute, c''est **pas** qui porte la négation, non *ne*. Entraînez l''oreille sur *pas*.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'PRONUNCIATION', 'https://www.youtube.com/watch?v=Cr7zrFrdvMc', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'The three nasal vowels', '| sound | spellings | examples |
|---|---|---|
| **[ɑ̃]** | an, am, en, em | grand, temps, enfant, ensemble |
| **[ɔ̃]** | on, om | bon, nom, maison, combien |
| **[ɛ̃]** | in, im, ain, ein, un | pain, matin, bien, un, important |

The air goes through the nose and **the n is never pronounced as a consonant**. *Bon* is [bɔ̃], not [bɔn].

Critical exception: when the n is followed by a vowel or doubled, the vowel stops being nasal.
- *bon* [bɔ̃] but *bonne* [bɔn]
- *un* [œ̃] but *une* [yn]
- *italien* [i.ta.ljɛ̃] but *italienne* [i.ta.ljɛn]

That is precisely how the ear tells masculine from feminine — which makes this the most useful pronunciation point in the whole level.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Les trois voyelles nasales', '| son | graphies | exemples |
|---|---|---|
| **[ɑ̃]** | an, am, en, em | grand, temps, enfant, ensemble |
| **[ɔ̃]** | on, om | bon, nom, maison, combien |
| **[ɛ̃]** | in, im, ain, ein, un | pain, matin, bien, un, important |

L''air passe par le nez et **le n ne se prononce jamais comme une consonne**. *Bon* se dit [bɔ̃], et non [bɔn].

Exception décisive : lorsque le n est suivi d''une voyelle ou redoublé, la voyelle cesse d''être nasale.
- *bon* [bɔ̃] mais *bonne* [bɔn]
- *un* [œ̃] mais *une* [yn]
- *italien* [i.ta.ljɛ̃] mais *italienne* [i.ta.ljɛn]

C''est exactement ainsi que l''oreille distingue le masculin du féminin — ce qui fait de ce point le plus utile de tout le niveau en matière de prononciation.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'ne … pas', 'nə.pa', 'Je ne parle pas encore bien.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'not (basic negation)', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'négation de base, en deux éléments', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'ne … plus', 'nə.ply', 'Je ne fume plus depuis un an.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'no longer, not any more', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'indique qu''une chose a cessé', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'ne … rien', 'nə.ʁjɛ̃', 'Je n''ai rien compris.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'nothing', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'aucune chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'ne … personne', 'nə.pɛʁ.sɔn', 'Il n''y a personne au guichet.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'nobody', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'aucune personne', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'ne … pas encore', 'nə.pa.zɑ̃.kɔʁ', 'Je n''ai pas encore reçu la réponse.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'not yet', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'cela n''a pas eu lieu jusqu''à présent', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'bon / bonne', 'bɔ̃ / bɔn', 'C''est une bonne idée.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'good', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'exemple type de nasale qui se dénasalise au féminin', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'important(e)', 'ɛ̃.pɔʁ.tɑ̃', 'C''est un document important.'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'important', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'qui compte beaucoup ; contient deux nasales', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'quelqu''un', 'kɛl.kœ̃', 'Est-ce qu''il y a quelqu''un ?'
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'someone', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'une personne indéterminée', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Put into the negative: « J''ai compris. »', 'Je n''ai pas compris — in the passé composé, negation wraps around the auxiliary only.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Mettez à la forme négative : « J''ai compris. »', 'Je n''ai pas compris — au passé composé, la négation encadre le seul auxiliaire.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je n''ai pas compris.', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je n''ai compris pas.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je ne compris pas.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', '« Je ne fume plus » means:', 'I used to smoke and I have stopped. Ne … plus marks the end of a former habit.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', '« Je ne fume plus » signifie :', 'Je fumais et j''ai arrêté. Ne … plus marque la fin d''une habitude passée.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Je fumais avant, j''ai arrêté', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Je n''ai jamais fumé', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je fume beaucoup', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'In which word is the vowel NOT nasal?', 'bonne — the doubled n followed by e denasalises the vowel: [bɔn].'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dans quel mot la voyelle n''est-elle PAS nasale ?', 'bonne — le n redoublé suivi d''un e dénasalise la voyelle : [bɔn].'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'bonne', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'bon', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'pain', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'grand', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Say that you have not received the answer yet (use « ne … pas encore »).', 'je n''ai pas encore reçu la réponse — encore slots in after pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dites que vous n''avez pas encore reçu la réponse (employez « ne … pas encore »).', 'je n''ai pas encore reçu la réponse — encore se place après pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je n''ai pas encore reçu la réponse'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je nai pas encore recu la reponse'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l08-negation-et-nasales';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Since French speakers drop « ne », you can leave it out in writing too.', 'False. Dropping ne belongs to informal speech. In writing — an email, a form, a letter — it is a register mistake.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Puisque les francophones suppriment le « ne », on peut aussi l''omettre à l''écrit.', 'Faux. L''omission du ne appartient à l''oral familier. À l''écrit — courriel, formulaire, lettre — c''est une faute de registre.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l08-negation-et-nasales' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 9 : Le français dans votre vie numérique
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l09-francais-et-numerique', 9, 30, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'French in your digital life', 'Turn the phone you already use all day into an immersion you do not have to schedule.', 'Can find and use simple online resources in French for everyday purposes.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Le français dans votre vie numérique', 'Transformer le téléphone déjà utilisé toute la journée en une immersion qui ne demande aucun créneau.', 'Peut trouver et utiliser des ressources en ligne simples en français pour des besoins quotidiens.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Four changes that cost nothing', 'The hardest thing about learning a language while working and dealing with paperwork is finding the time. The way round it is not to find time, but to change the language of the time you already spend.

**1. Switch your phone to French.** You already know what every icon does, so you learn the words with no risk of getting lost. This alone exposes you to French a hundred times a day.

**2. Follow five French-speaking accounts** on whatever social network you already use — cooking, football, news, anything you actually care about. Interest sustains attention far better than discipline.

**3. Search in French.** *Comment ouvrir un compte bancaire* returns French pages, and French pages contain the exact phrases you will need at the counter.

**4. Change your keyboard.** Adding the French keyboard gives you é, è, ç without gymnastics, and autocorrect becomes a free spelling tutor.

None of these adds a single minute to your day.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Quatre changements qui ne coûtent rien', 'Le plus difficile, lorsqu''on apprend une langue tout en travaillant et en menant des démarches, est de trouver le temps. Le contournement ne consiste pas à trouver du temps, mais à changer la langue du temps déjà passé.

**1. Passez votre téléphone en français.** Vous savez déjà ce que fait chaque icône : vous en apprenez donc les mots sans risquer de vous perdre. Cette seule mesure vous expose au français cent fois par jour.

**2. Suivez cinq comptes francophones** sur le réseau que vous utilisez déjà — cuisine, football, actualité, peu importe, pourvu que le sujet vous intéresse vraiment. L''intérêt soutient l''attention bien mieux que la discipline.

**3. Faites vos recherches en français.** *Comment ouvrir un compte bancaire* renvoie des pages françaises, et ces pages contiennent les tournures exactes dont vous aurez besoin au guichet.

**4. Changez de clavier.** Ajouter le clavier français donne accès à é, è, ç sans acrobatie, et la correction automatique devient un professeur d''orthographe gratuit.

Aucune de ces mesures n''ajoute une minute à votre journée.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Digital vocabulary', 'un ordinateur · un téléphone portable · une application · un mot de passe · un compte · une adresse électronique (un courriel) · télécharger · s''inscrire · se connecter · envoyer · le réseau · un fichier · une pièce jointe

Phrases you will actually need:
- *Je n''arrive pas à me connecter.* — I can''t log in.
- *J''ai oublié mon mot de passe.*
- *Le site ne fonctionne pas.*
- *Est-ce que je peux faire la demande en ligne ?*
- *Je vous envoie le document en pièce jointe.*

Most French administrative procedures now start online. *Faire une demande en ligne* is often faster than queuing — and it gives you time to read, translate and check before submitting.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Le vocabulaire du numérique', 'un ordinateur · un téléphone portable · une application · un mot de passe · un compte · une adresse électronique (un courriel) · télécharger · s''inscrire · se connecter · envoyer · le réseau · un fichier · une pièce jointe

Des phrases dont vous aurez réellement besoin :
- *Je n''arrive pas à me connecter.*
- *J''ai oublié mon mot de passe.*
- *Le site ne fonctionne pas.*
- *Est-ce que je peux faire la demande en ligne ?*
- *Je vous envoie le document en pièce jointe.*

La plupart des démarches administratives françaises commencent désormais en ligne. *Faire une demande en ligne* est souvent plus rapide que la file d''attente — et cela laisse le temps de lire, de traduire et de vérifier avant de valider.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'CULTURE', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Free resources worth knowing', '| resource | what it offers |
|---|---|
| **TV5MONDE Apprendre** | free exercises graded by CEFR level, from A1 |
| **RFI Savoirs — Journal en français facile** | the news read slowly, with transcript |
| **France Éducation international** | official information on DELF and DALF exams |
| **Your town library** | free membership, French conversation groups, computers |
| **The OFII / local associations** | state-funded French courses for newcomers, often free |

One word of caution about automatic translation: it is useful to understand, unreliable to produce. A machine-translated cover letter reads as machine-translated, and that costs you interviews. Write simply in French instead — a short, correct letter beats a long, odd one.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Des ressources gratuites à connaître', '| ressource | ce qu''elle offre |
|---|---|
| **TV5MONDE Apprendre** | exercices gratuits classés par niveau du CECR, dès le A1 |
| **RFI Savoirs — Journal en français facile** | l''actualité lue lentement, avec transcription |
| **France Éducation international** | informations officielles sur le DELF et le DALF |
| **La bibliothèque de votre ville** | inscription gratuite, ateliers de conversation, ordinateurs |
| **L''OFII et les associations locales** | cours de français financés par l''État pour les nouveaux arrivants, souvent gratuits |

Une mise en garde sur la traduction automatique : elle est utile pour comprendre, peu fiable pour produire. Une lettre de motivation traduite automatiquement se reconnaît immédiatement, et cela coûte des entretiens. Écrivez plutôt simplement en français : une lettre courte et correcte vaut mieux qu''une lettre longue et étrange.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'un mot de passe', 'mo.də.pas', 'J''ai oublié mon mot de passe.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'a password', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'code secret d''accès à un compte', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'se connecter', 'sə.kɔ.nɛk.te', 'Je n''arrive pas à me connecter au site.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to log in, to connect', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'accéder à un service en ligne', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 's''inscrire', 'sɛ̃s.kʁiʁ', 'Il faut s''inscrire en ligne avant le 30 juin.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to register, to sign up', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'enregistrer son nom pour participer', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'télécharger', 'te.le.ʃaʁ.ʒe', 'Vous pouvez télécharger le formulaire ici.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to download', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'transférer un fichier depuis internet', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'une pièce jointe', 'pjɛs.ʒwɛ̃t', 'Je vous envoie le justificatif en pièce jointe.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an attachment', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'fichier joint à un courriel', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'en ligne', 'ɑ̃.liɲ', 'La demande se fait en ligne.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'online', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'par internet', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'un compte', 'kɔ̃t', 'J''ai créé un compte sur le site de la préfecture.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an account', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'espace personnel sur un service', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'une démarche', 'de.maʁʃ', 'Cette démarche prend deux mois.'
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'an administrative procedure', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'ensemble d''actions pour obtenir quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Why is switching your phone to French effective?', 'You already know what each icon does, so you learn the words with no risk of getting lost — and you see them a hundred times a day.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Pourquoi passer son téléphone en français est-il efficace ?', 'Vous savez déjà ce que fait chaque icône : vous en apprenez les mots sans risque de vous perdre — et vous les voyez cent fois par jour.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'On apprend les mots sans risquer de se perdre', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Le téléphone fonctionne mieux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Cela traduit automatiquement les messages', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'What is « une pièce jointe »?', 'A file attached to an email — the word you will read in almost every administrative reply.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Qu''est-ce qu''« une pièce jointe » ?', 'Un fichier joint à un courriel — le mot que l''on lit dans presque toute réponse administrative.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Un fichier joint à un courriel', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Une pièce d''identité', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Une salle de réunion', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'For a cover letter in French, what is the best approach?', 'Write simply in French. Machine translation is recognisable and works against you.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Pour une lettre de motivation en français, quelle est la meilleure approche ?', 'Écrire simplement en français. La traduction automatique se reconnaît et dessert la candidature.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Écrire simplement, directement en français', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Écrire dans sa langue puis traduire automatiquement', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Copier un modèle très long trouvé en ligne', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Say that you cannot log in to the website.', 'je n''arrive pas à me connecter au site — « ne pas arriver à » is the everyday way of saying you cannot manage something.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dites que vous n''arrivez pas à vous connecter au site.', 'je n''arrive pas à me connecter au site — « ne pas arriver à » est la façon courante de dire que l''on n''y parvient pas.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je n''arrive pas à me connecter au site'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je narrive pas a me connecter au site'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'je n''arrive pas à me connecter'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l09-francais-et-numerique';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Public libraries in France often offer free French conversation groups.', 'True. Libraries and local associations run free conversation groups; ask at the desk or check the noticeboard.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Les bibliothèques publiques en France proposent souvent des ateliers de conversation gratuits.', 'Vrai. Bibliothèques et associations locales animent des ateliers de conversation gratuits ; renseignez-vous à l''accueil ou consultez le panneau d''affichage.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l09-francais-et-numerique' AND e.position = 5 AND o.position = 2;

-- ------------------------------------------------------------------
-- Leçon 10 : Derniers verbes et bilan du niveau
-- ------------------------------------------------------------------
INSERT INTO lessons (unit_id, slug, position, estimated_minutes, published)
SELECT id, 'a1-u3-l10-verbes-utiles-bilan', 10, 40, TRUE
FROM units WHERE slug = 'a1-unit-3';

INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'en', 'Final verbs and level review', 'Penser, faire, venir, essayer, inviter — and an honest look at what A1 has given you.', 'Can express an opinion, a need and an invitation, and assess their own A1 competences.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO lesson_translations (lesson_id, locale, title, summary, objective)
SELECT id, 'fr', 'Derniers verbes et bilan du niveau', 'Penser, faire, venir, essayer, inviter — et un bilan honnête de ce que le niveau A1 vous a apporté.', 'Peut exprimer une opinion, un besoin et une invitation, et évaluer ses propres compétences de niveau A1.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 1, 'GRAMMAR', 'https://www.youtube.com/watch?v=ZpO4sA9JyeI', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Five more verbs worth having', '| | faire | venir | penser |
|---|---|---|---|
| je | fais | viens | pense |
| tu | fais | viens | penses |
| il / elle | fait | vient | pense |
| nous | faisons | venons | pensons |
| vous | **faites** | venez | pensez |
| ils / elles | **font** | viennent | pensent |

*essayer* and *inviter* are regular -er verbs.

Structures that make these verbs useful:
- **penser que** — *je pense que c''est une bonne idée*
- **avoir besoin de** — *j''ai besoin d''un justificatif*
- **essayer de + infinitive** — *j''essaie de parler tous les jours*
- **se souvenir de** — *je me souviens de son nom*

Note *vous faites* and *ils font*: two of the most irregular forms in French, and among the most used.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND s.position = 1;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Cinq verbes de plus à posséder', '| | faire | venir | penser |
|---|---|---|---|
| je | fais | viens | pense |
| tu | fais | viens | penses |
| il / elle | fait | vient | pense |
| nous | faisons | venons | pensons |
| vous | **faites** | venez | pensez |
| ils / elles | **font** | viennent | pensent |

*essayer* et *inviter* sont des verbes réguliers en -er.

Les structures qui rendent ces verbes utiles :
- **penser que** — *je pense que c''est une bonne idée*
- **avoir besoin de** — *j''ai besoin d''un justificatif*
- **essayer de + infinitif** — *j''essaie de parler tous les jours*
- **se souvenir de** — *je me souviens de son nom*

Remarquez *vous faites* et *ils font* : deux des formes les plus irrégulières du français, et parmi les plus employées.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND s.position = 1;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 2, 'VOCABULARY', 'https://www.youtube.com/watch?v=ZxJH00s4-8A', 'VIDEO'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'Inviting and accepting', '**Inviting**
- *Tu veux venir dîner samedi ?*
- *Ça te dit d''aller au cinéma ?*
- *Je vous invite.* — I''m paying.

**Accepting**
- *Avec plaisir !*
- *Volontiers, merci.*
- *C''est très gentil.*

**Declining without offence**
- *C''est gentil, mais je ne peux pas ce jour-là.*
- *Une autre fois, peut-être ?*

A French *non* on its own is abrupt. The usual shape is: thank, decline, propose an alternative. Three short clauses, and the relationship stays intact.

One cultural note: if you are invited to someone''s home, arriving ten to fifteen minutes after the stated time is normal and expected. Arriving exactly on time can catch the host unprepared.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND s.position = 2;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Inviter et accepter', '**Inviter**
- *Tu veux venir dîner samedi ?*
- *Ça te dit d''aller au cinéma ?*
- *Je vous invite.* — c''est moi qui paie.

**Accepter**
- *Avec plaisir !*
- *Volontiers, merci.*
- *C''est très gentil.*

**Refuser sans froisser**
- *C''est gentil, mais je ne peux pas ce jour-là.*
- *Une autre fois, peut-être ?*

Un *non* seul est brusque en français. La forme habituelle est : remercier, refuser, proposer une alternative. Trois propositions courtes, et la relation reste intacte.

Une remarque culturelle : lorsqu''on est invité chez quelqu''un, arriver dix à quinze minutes après l''heure annoncée est normal et attendu. Arriver pile à l''heure peut surprendre l''hôte en pleins préparatifs.'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND s.position = 2;

INSERT INTO lesson_sections (lesson_id, position, section_type, media_url, media_type)
SELECT id, 3, 'SUMMARY', NULL, NULL
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'en', 'What A1 has given you', 'At the end of these thirty lessons, you can:

- introduce yourself, spell your name, give your details
- count, tell the time, read a date and an appointment letter
- describe people, your family, your home and your town
- speak in the present, the passé composé, the imparfait and the near future
- ask questions in three registers and understand the answers
- compare, negate, express taste, obligation and need
- make simple purchases, ask the way, write a short formal email
- follow a simple audio document and read a short narrative text

That is the A1 level of the CEFR. **This course is not an official certification** — only accredited bodies award the DELF. But this is the ground on which a DELF A1 is prepared, and it is enough to open a bank account, understand a convocation and hold a first conversation.

**Where to go next:** level A2 extends what you have here — the futur simple, pronouns, more connectors, longer texts. The structure of this platform is built so that A2 can be added without anything you have learnt being invalidated.

And the most important sentence of the whole course, which is not grammar: *the language is not learnt by finishing a course; it is learnt by using it, badly, every day, until it becomes yours.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND s.position = 3;
INSERT INTO lesson_section_translations (section_id, locale, title, body)
SELECT s.id, 'fr', 'Ce que le niveau A1 vous a apporté', 'Au terme de ces trente leçons, vous savez :

- vous présenter, épeler votre nom, donner vos informations personnelles
- compter, dire l''heure, lire une date et une convocation
- décrire des personnes, votre famille, votre logement et votre ville
- vous exprimer au présent, au passé composé, à l''imparfait et au futur proche
- poser des questions dans trois registres et comprendre les réponses
- comparer, nier, exprimer un goût, une obligation et un besoin
- faire des achats simples, demander votre chemin, rédiger un court courriel formel
- suivre un document sonore simple et lire un texte narratif court

C''est le niveau A1 du CECR. **Ce cours ne constitue pas une certification officielle** — seuls les organismes habilités délivrent le DELF. Mais c''est le socle sur lequel se prépare un DELF A1, et il suffit à ouvrir un compte bancaire, comprendre une convocation et tenir une première conversation.

**La suite :** le niveau A2 prolonge ce que vous avez ici — le futur simple, les pronoms, davantage de connecteurs, des textes plus longs. La structure de cette plateforme est conçue pour que l''A2 s''ajoute sans rien invalider de ce que vous avez appris.

Et la phrase la plus importante de tout le cours, qui n''est pas de la grammaire : *une langue ne s''apprend pas en finissant un cours ; elle s''apprend en s''en servant, mal, tous les jours, jusqu''à ce qu''elle devienne la vôtre.*'
FROM lesson_sections s JOIN lessons l ON l.id = s.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND s.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 1, 'penser', 'pɑ̃.se', 'Je pense que c''est une bonne idée.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to think', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 1;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'avoir une opinion ; réfléchir', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 1;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 2, 'avoir besoin de', 'a.vwaʁ.bə.zwɛ̃.də', 'J''ai besoin d''un justificatif de domicile.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to need', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 2;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'éprouver la nécessité de quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 2;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 3, 'essayer', 'e.se.je', 'J''essaie de parler français tous les jours.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to try', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 3;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'tenter de faire quelque chose', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 3;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 4, 'inviter', 'ɛ̃.vi.te', 'Je vous invite à dîner samedi.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to invite', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 4;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'proposer à quelqu''un de venir', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 4;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 5, 'se souvenir de', 'sə.suv.niʁ.də', 'Je me souviens très bien de ce jour.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to remember', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 5;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'garder en mémoire', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 5;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 6, 'avec plaisir', 'a.vɛk.ple.ziʁ', '— Tu viens dîner ? — Avec plaisir !'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'with pleasure, gladly', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 6;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'formule d''acceptation chaleureuse', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 6;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 7, 'peut-être', 'pø.tɛtʁ', 'Une autre fois, peut-être ?'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'maybe, perhaps', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 7;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'marque l''incertitude ou une proposition prudente', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 7;

INSERT INTO vocabulary_items (lesson_id, position, term, phonetic, example_sentence)
SELECT id, 8, 'continuer', 'kɔ̃.ti.nɥe', 'Je vais continuer avec le niveau A2.'
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'en', 'to continue', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 8;
INSERT INTO vocabulary_translations (item_id, locale, translation, note)
SELECT v.id, 'fr', 'poursuivre ce qui est commencé', NULL
FROM vocabulary_items v JOIN lessons l ON l.id = v.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND v.position = 8;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 1, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « Vous ___ quoi ce week-end ? » (faire)', 'faites — one of only three French verbs whose vous form does not end in -ez (faire, dire, être).'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 1;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « Vous ___ quoi ce week-end ? » (faire)', 'faites — l''un des trois seuls verbes français dont la forme vous ne se termine pas par -ez (faire, dire, être).'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'faites', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'faisez', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'font', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 1;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 2, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Complete: « J''ai besoin ___ un justificatif. »', 'd'' — avoir besoin is always followed by de, which elides before a vowel: j''ai besoin d''un justificatif.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 2;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Complétez : « J''ai besoin ___ un justificatif. »', 'd'' — avoir besoin se construit toujours avec de, qui s''élide devant une voyelle : j''ai besoin d''un justificatif.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'd''', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'de le', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'à', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 2;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 4, 'pour', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 2;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 3, 'MULTIPLE_CHOICE', 1
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'You are invited but cannot come. What is the best answer?', 'Thank, decline, propose an alternative. A bare « non » is abrupt in French.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 3;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'On vous invite mais vous ne pouvez pas venir. Quelle est la meilleure réponse ?', 'Remercier, refuser, proposer une autre date. Un « non » seul est brusque en français.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'C''est gentil, mais je ne peux pas ce jour-là. Une autre fois ?', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Non.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 3;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 3, 'Je ne veux pas.', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 3;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 4, 'FILL_BLANK', 2
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Say that you try to speak French every day (use essayer de).', 'j''essaie de parler français tous les jours — essayer is always followed by de + infinitive.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 4;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Dites que vous essayez de parler français tous les jours (employez essayer de).', 'j''essaie de parler français tous les jours — essayer se construit toujours avec de + infinitif.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'j''essaie de parler français tous les jours'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'jessaie de parler francais tous les jours'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 4;
INSERT INTO exercise_answers (exercise_id, normalized_answer)
SELECT e.id, 'j''essaye de parler français tous les jours'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 4;

INSERT INTO exercises (lesson_id, position, exercise_type, points)
SELECT id, 5, 'TRUE_FALSE', 1
FROM lessons WHERE slug = 'a1-u3-l10-verbes-utiles-bilan';
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'en', 'Completing this course gives you an official A1 certification.', 'False. The course follows the CEFR descriptors as a guide, but only accredited bodies award the DELF A1. What you get here is the preparation, freely.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5;
INSERT INTO exercise_translations (exercise_id, locale, prompt, explanation)
SELECT e.id, 'fr', 'Terminer ce cours délivre une certification officielle de niveau A1.', 'Faux. Le cours suit les descripteurs du CECR à titre indicatif, mais seuls les organismes habilités délivrent le DELF A1. Ce que vous obtenez ici, c''est la préparation, gratuitement.'
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 1, 'Vrai', FALSE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'True'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Vrai'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5 AND o.position = 1;
INSERT INTO exercise_options (exercise_id, position, label, correct)
SELECT e.id, 2, 'Faux', TRUE
FROM exercises e JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'en', 'False'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5 AND o.position = 2;
INSERT INTO exercise_option_translations (option_id, locale, label)
SELECT o.id, 'fr', 'Faux'
FROM exercise_options o JOIN exercises e ON e.id = o.exercise_id
JOIN lessons l ON l.id = e.lesson_id
WHERE l.slug = 'a1-u3-l10-verbes-utiles-bilan' AND e.position = 5 AND o.position = 2;
