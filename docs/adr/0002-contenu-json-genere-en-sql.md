# ADR 0002 — Contenu rédigé en JSON, converti en migrations Flyway

**Statut** : accepté · **Date** : 2026-09-12

## Contexte

Trente leçons représentent environ 900 éléments traduits. Le contenu doit être versionné (preuve de
l'avancement mensuel), relu par un professeur, et chargé de façon reproductible sur n'importe quelle
base. L'auteur est le seul rédacteur, et une interface d'administration serait un chantier et une
surface d'attaque supplémentaires pour trois mois de projet.

## Options étudiées

1. **SQL écrit à la main** — reproductible, mais illisible et source d'erreurs (apostrophes, positions).
2. **Interface d'administration** — confortable, mais contenu hors du dépôt, non versionné, et
   plusieurs semaines de développement.
3. **Chargement JSON au démarrage de l'application** — lisible, mais logique d'import à maintenir et
   comportement incertain lors des mises à jour.
4. **JSON source + génération de migrations Flyway versionnées**.

## Décision

Option 4. `content/a1/unit-N.json` est la source éditoriale ; `tools/generate_seed.py` valide la
cohérence pédagogique et écrit `V{N+2}__seed_a1_unitN.sql`. Le SQL généré est commité : Flyway reste la
seule source de vérité au démarrage. La CI exécute `generate_seed.py --check` pour détecter tout écart.

## Conséquences

- Rédaction lisible par un enseignant, historique Git de chaque correction pédagogique.
- Règles vérifiées automatiquement avant chaque commit et en CI.
- Insertions par sous-requêtes sur les `slug` : aucun identifiant technique écrit en dur.
- **Contrainte** : une migration déjà appliquée en production est immuable. Les corrections après
  déploiement passent par des migrations correctives (`UPDATE`). Documenté dans
  [05-deploiement.md §5.8](../05-deploiement.md).
