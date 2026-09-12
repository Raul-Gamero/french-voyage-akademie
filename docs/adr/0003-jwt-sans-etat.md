# ADR 0003 — Authentification JWT sans état

**Statut** : accepté · **Date** : 2026-09-12

## Contexte

Le client est une PWA qui doit rester utilisable après un redémarrage du téléphone et en connexion
intermittente. Le serveur est un VPS unique aux ressources limitées, redéployé automatiquement à chaque
push sur `main`. Le document de projet engage Spring Security, JWT et BCrypt.

## Décision

- Jeton d'accès JWT signé en HMAC-SHA256, émetteur contrôlé, validité configurable (120 minutes par
  défaut), contenant l'adresse, l'identifiant et le rôle.
- Aucune session serveur : `SessionCreationPolicy.STATELESS`, CSRF désactivé en conséquence (aucun
  cookie d'authentification).
- Le filtre recharge l'utilisateur à chaque requête : un compte supprimé ou désactivé perd l'accès
  immédiatement, sans liste de révocation.
- Clé fournie par variable d'environnement ; démarrage refusé si elle compte moins de 32 caractères.

## Options écartées

- **Sessions serveur avec cookie** : état à conserver entre redéploiements, et CSRF à gérer.
- **Jeton de rafraîchissement** : utile, mais ajoute une table, une rotation et un flux d'expiration.
  Reporté après le service social ; à l'expiration, l'apprenant se reconnecte.

## Conséquences

- Redéploiement sans déconnexion des apprenants tant que la clé ne change pas.
- Le jeton est stocké en `localStorage` : exposé en cas de faille XSS. Mitigations : politique de
  sécurité du contenu stricte (`script-src 'self'`), aucun script tiers, rendu Markdown qui échappe
  tout HTML ([ADR 0005](0005-markdown-maison.md)), durée de vie courte.
- Changer `FVA_JWT_SECRET` déconnecte tout le monde : c'est aussi la procédure d'urgence en cas de fuite.
