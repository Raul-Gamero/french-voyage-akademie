# ADR 0004 — Catalogue consultable sans compte

**Statut** : accepté · **Date** : 2026-09-12

## Contexte

Le public visé se méfie, avec raison, des plateformes qui exigent des données avant de montrer quoi que
ce soit. Créer un compte est un frein, plus encore pour une personne en situation administrative
fragile. Mais la progression et l'évaluation exigent de savoir qui répond.

## Décision

- Niveaux, unités, leçons complètes et textes légaux sont **publics** en lecture.
- Répondre aux exercices, enregistrer sa progression et gérer son profil exigent un compte.
- Les exercices sont visibles sans compte ; les boutons de réponse invitent alors à se connecter.
- Les réponses du catalogue sont mises en cache 30 minutes (`Cache-Control: public`) et par le service
  worker pendant 7 jours.

## Conséquences

- Une personne peut apprendre toute la grammaire du niveau A1 sans jamais donner une adresse.
- Le cache public allège fortement la charge du VPS : la lecture représente l'essentiel du trafic.
- La correction ne quitte jamais le serveur : exposer les exercices sans compte ne révèle pas les
  réponses. Un test (`CatalogServiceTest.correctAnswerIsNeverExposed`) et la vérification de bout en
  bout le garantissent.
- Le nombre de « lecteurs » réels n'apparaît pas dans les inscriptions ; Matomo le mesure.
