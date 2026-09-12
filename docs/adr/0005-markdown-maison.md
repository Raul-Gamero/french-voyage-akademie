# ADR 0005 — Rendu Markdown écrit sur mesure

**Statut** : accepté · **Date** : 2026-09-12

## Contexte

Les sections de leçon contiennent des tableaux de conjugaison, des listes, des citations et de la mise
en valeur. Il faut les afficher en HTML dans la PWA, pour un public souvent limité en données mobiles,
et sans ouvrir de faille XSS — le jeton d'authentification est en `localStorage` ([ADR 0003](0003-jwt-sans-etat.md)).

## Options étudiées

1. **Bibliothèque complète** (`marked`, `markdown-it`) + nettoyage (`DOMPurify`) : robuste, mais
   plusieurs dizaines de kilo-octets, une syntaxe bien plus large que nécessaire, et deux dépendances
   de sécurité à suivre.
2. **HTML stocké en base** : aucun rendu côté client, mais contenu illisible pour la rédaction et
   confiance aveugle dans ce qui est stocké.
3. **Rendu restreint écrit sur mesure** (`LessonMarkdownPipe`).

## Décision

Option 3. Le pipe accepte uniquement : titres, paragraphes, listes, citations, tableaux, gras, italique
et code en ligne. **Tout le texte est échappé avant l'ajout de la moindre balise**, puis le résultat
repasse par le `DomSanitizer` d'Angular.

## Conséquences

- Environ 5 Ko de code, aucune dépendance.
- Impossible d'injecter du HTML par le contenu : testé (`lesson-markdown.pipe.spec.ts`), y compris dans
  une cellule de tableau.
- Toute syntaxe non prévue s'affiche littéralement : une faute de rédaction reste visible et ne casse
  pas la page.
- Contrepartie : chaque nouvelle syntaxe (images, liens internes) doit être ajoutée explicitement et
  testée.
