-- =====================================================================
-- Niveaux CECR.
-- Seul A1 est publié : les niveaux A2 à C2 sont déclarés dès maintenant
-- pour démontrer que l'extension future ne demande que du contenu.
-- =====================================================================

INSERT INTO levels (code, position, published) VALUES
    ('A1', 1, TRUE),
    ('A2', 2, FALSE),
    ('B1', 3, FALSE),
    ('B2', 4, FALSE),
    ('C1', 5, FALSE),
    ('C2', 6, FALSE);

INSERT INTO level_translations (level_id, locale, name, description)
SELECT l.id, 'en', t.name_en, t.description_en
FROM levels l
JOIN (VALUES
    ('A1', 'A1 — Beginner',            'Understand and use everyday expressions, introduce yourself and handle simple, concrete situations.'),
    ('A2', 'A2 — Elementary',          'Communicate in simple, routine tasks about familiar topics.'),
    ('B1', 'B1 — Intermediate',        'Deal with most situations while travelling and describe experiences and plans.'),
    ('B2', 'B2 — Upper intermediate',  'Interact with fluency and produce clear, detailed text on a wide range of subjects.'),
    ('C1', 'C1 — Advanced',            'Express yourself fluently and spontaneously for social, academic and professional purposes.'),
    ('C2', 'C2 — Proficiency',         'Understand with ease virtually everything heard or read.')
) AS t(code, name_en, description_en) ON t.code = l.code;

INSERT INTO level_translations (level_id, locale, name, description)
SELECT l.id, 'fr', t.name_fr, t.description_fr
FROM levels l
JOIN (VALUES
    ('A1', 'A1 — Débutant',            'Comprendre et utiliser des expressions du quotidien, se présenter et faire face à des situations simples et concrètes.'),
    ('A2', 'A2 — Élémentaire',         'Communiquer lors de tâches simples et habituelles sur des sujets familiers.'),
    ('B1', 'B1 — Intermédiaire',       'Se débrouiller dans la plupart des situations en voyage et décrire des expériences et des projets.'),
    ('B2', 'B2 — Intermédiaire avancé','Communiquer avec aisance et produire un texte clair et détaillé sur une grande variété de sujets.'),
    ('C1', 'C1 — Avancé',              'S''exprimer couramment et spontanément dans la vie sociale, universitaire et professionnelle.'),
    ('C2', 'C2 — Maîtrise',            'Comprendre sans effort pratiquement tout ce qui est lu ou entendu.')
) AS t(code, name_fr, description_fr) ON t.code = l.code;
