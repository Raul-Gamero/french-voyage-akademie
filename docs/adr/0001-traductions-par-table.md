# ADR 0001 — Textes traduits dans des tables `*_translations`

**Statut** : accepté · **Date** : 2026-09-12

## Contexte

L'interface est livrée en anglais et en français, et le projet s'engage à pouvoir ajouter l'espagnol,
l'allemand puis d'autres langues **sans modifier la structure** (objectif spécifique n° 9). Chaque
leçon comporte des titres, des résumés, des sections, des gloses de vocabulaire et des consignes, tous
à traduire.

## Options étudiées

1. **Colonnes par langue** (`title_en`, `title_fr`) — simple, mais chaque nouvelle langue impose une
   migration de schéma sur une dizaine de tables et une modification de toutes les entités.
2. **Table générique clé-valeur** (`entity_type, entity_id, field, locale, value`) — totalement
   flexible, mais sans intégrité référentielle, sans typage, et coûteuse à interroger.
3. **Une table de traduction par entité** (`lesson_translations(lesson_id, locale, title, summary…)`).

## Décision

Option 3. En JPA, chaque entité expose `Map<String, XxxText> translations` via `@ElementCollection` et
`@MapKeyColumn(name = "locale")`. `LocaleSupport.resolve` choisit la langue demandée, puis l'anglais,
puis n'importe quelle traduction disponible.

## Conséquences

- Ajouter une langue : insérer des lignes et étendre `LocaleSupport.SUPPORTED`. Aucune migration de
  structure, aucune entité modifiée.
- Intégrité conservée : clés étrangères et suppression en cascade.
- Une traduction manquante n'efface jamais un contenu : repli sur l'anglais.
- Coût : davantage de tables (sept tables de traduction) et des requêtes supplémentaires au chargement
  d'une leçon, négligeables à ce volume et amorties par le cache HTTP de 30 minutes.
