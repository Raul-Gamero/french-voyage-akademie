# 6. Contenu pédagogique — niveau A1

## 6.1 Origine

Le programme reprend et structure le matériel de cours déjà enseigné par l'auteur en classe (plans
`JOUR1` à `JOUR10` des unités 1 à 3). Chaque plan de cours est devenu une leçon autonome comportant :
un objectif formulé d'après un descripteur A1 du CECR, trois sections de contenu bilingues, huit
entrées de vocabulaire avec transcription phonétique et exemple, et cinq exercices corrigés
automatiquement avec explication. Les vidéos d'appui des cours d'origine sont conservées par lien,
sans reproduction.

## 6.2 Progression

### Unité 1 — Premier contact

| # | Leçon | Contenus principaux |
|---|---|---|
| 1 | Se présenter | être, avoir, tu / vous, phrases de survie en classe |
| 2 | L'alphabet et les sons | épeler, [u]/[y], nasales, lettres muettes, accents |
| 3 | Les nombres, les jours et l'heure | 0–100, soixante-dix / septante, dates, heure sur 24 h |
| 4 | Décrire une personne | accord et place de l'adjectif, couleurs, corps, *avoir mal à* |
| 5 | Le présent et dire où l'on habite | verbes en -er, à / en / au / aux, depuis / pendant / il y a / dans |
| 6 | La famille et les possessifs | mon / ma / mes, *mon amie*, formulaires de situation familiale |
| 7 | Aller et le futur proche | aller, aller + infinitif, congés et jours fériés |
| 8 | Les verbes du voyage | partir, prendre, dormir, savoir / connaître, à la gare |
| 9 | Le courrier et demander son chemin | écrire, lire, envoyer, courrier administratif, itinéraire |
| 10 | L'argent, les magasins et les partitifs | acheter, vendre, choisir, du / de la / des, négation + de |

### Unité 2 — La vie quotidienne et le passé récent

| # | Leçon | Contenus principaux |
|---|---|---|
| 1 | Paris et le monde francophone | variétés du français, méthode d'écoute authentique |
| 2 | Les verbes les plus utiles | vingt verbes essentiels, trois groupes, méthode d'apprentissage |
| 3 | Le passé composé | avoir ou être, participes, pronominaux au passé |
| 4 | La vie quotidienne, la maison et la ville | routine pronominale, logement, services publics |
| 5 | Les verbes de l'action quotidienne | écouter, regarder, commencer, finir ; constructions prépositionnelles ; venir de |
| 6 | Étudier, donner, aimer | mettre, s'asseoir, exprimer ses goûts, formation et diplômes |
| 7 | Pouvoir, vouloir, devoir | modaux, il faut, demande polie (je voudrais, pourriez-vous) |
| 8 | Les prépositions de lieu | à, de, dans, sur, chez, en ; contractions ; adresses |
| 9 | Les adverbes de temps et de fréquence | connecteurs de récit, place de l'adverbe |
| 10 | Consolider sa conjugaison | choix du temps, bilan de l'unité |

### Unité 3 — Raconter, comparer, s'exprimer

| # | Leçon | Contenus principaux |
|---|---|---|
| 1 | Lecture : l'histoire de Marie | texte narratif, imparfait et passé composé en contexte |
| 2 | L'imparfait | formation, emplois, oppositions avec le passé composé |
| 3 | Poser des questions | trois registres, mots interrogatifs, questions utiles aux guichets |
| 4 | Comparer | comparatif, superlatif, meilleur / mieux |
| 5 | Regarder un film en français | sous-titres, méthode de visionnage, donner son avis |
| 6 | Les cinq sens | voir / regarder, entendre / écouter, sentir, à table |
| 7 | La musique francophone | chanson et mémorisation, registres, parler de musique |
| 8 | La négation et les voyelles nasales | ne … pas / plus / rien / personne, *ne* à l'oral, [ɑ̃] [ɔ̃] [ɛ̃] |
| 9 | Le français dans votre vie numérique | immersion par le téléphone, vocabulaire des démarches en ligne |
| 10 | Derniers verbes et bilan du niveau | faire, venir, penser, avoir besoin de, inviter ; bilan A1 |

## 6.3 Principes de rédaction

- **Contextes réels du public visé.** Les exemples sont pris à la mairie, à la préfecture, chez le
  médecin, à la gare, dans un courrier administratif — là où la barrière linguistique pèse le plus.
- **L'erreur enseigne.** Chaque exercice renvoie une explication, que la réponse soit juste ou non.
- **Interférences anticipées.** Les explications ciblent les calques fréquents de l'espagnol et de
  l'anglais (*je suis 25 ans*, *j'attends pour le bus*, *le plus grand musée dans la ville*).
- **Tolérance orthographique mesurée.** Accents, casse et ponctuation sont ignorés dans les textes à
  trous ; la forme correcte figure toujours dans l'explication.
- **Aucune promesse de certification.** Le CECR est une référence indicative (leçon 3.10 et mentions
  légales).

## 6.4 Modifier ou ajouter du contenu

Format d'une leçon dans `content/a1/unit-N.json` :

```json
{
  "slug": "a1-u1-l01-se-presenter",
  "position": 1,
  "minutes": 30,
  "published": true,
  "title":     { "en": "…", "fr": "…" },
  "summary":   { "en": "…", "fr": "…" },
  "objective": { "en": "…", "fr": "…" },
  "sections": [
    { "type": "GRAMMAR", "media": { "url": "https://…", "type": "VIDEO" },
      "title": { "en": "…", "fr": "…" }, "body": { "en": "Markdown…", "fr": "Markdown…" } }
  ],
  "vocabulary": [
    { "term": "bonjour", "phonetic": "bɔ̃.ʒuʁ", "example": "Bonjour, madame.",
      "gloss": { "en": "hello", "fr": "salutation employée pendant la journée" } }
  ],
  "exercises": [
    { "type": "MULTIPLE_CHOICE", "points": 1,
      "prompt": { "en": "…", "fr": "…" }, "explanation": { "en": "…", "fr": "…" },
      "options": [["suis", true], ["ai", false]] },
    { "type": "FILL_BLANK", "points": 2,
      "prompt": { "en": "…", "fr": "…" }, "explanation": { "en": "…", "fr": "…" },
      "answers": ["je m'appelle marie"] }
  ]
}
```

Types de section : `INTRODUCTION`, `GRAMMAR`, `VOCABULARY`, `PRONUNCIATION`, `CULTURE`, `READING`,
`MEDIA`, `SUMMARY`. Pour un vrai/faux, les options `Vrai` et `Faux` reçoivent automatiquement leur
libellé anglais.

Puis :

```bash
python tools/generate_seed.py
```

Le script refuse de générer si un QCM n'a pas exactement une bonne réponse, si un texte à trous n'a
aucune réponse attendue, si un titre manque dans une langue ou si un slug est dupliqué.

Pour **ouvrir le niveau A2** : créer `content/a2/`, adapter `CONTENT_DIR` et la numérotation de
version dans le script, puis passer `published` à vrai pour A2 par migration. Aucune modification du
schéma, des entités ni du frontend n'est nécessaire.
