# 7. Qualité, protection des données et accessibilité

Ce document relie chaque exigence du projet de service social à ce qui est implémenté et à la manière
de le prouver. La colonne « État » distingue ce qui a été **vérifié** de ce qui reste **à mesurer**
une fois la plateforme en production.

## 7.1 Attributs de qualité — ISO/IEC 25010

| Attribut | Exigence engagée | Mise en œuvre | Preuve | État |
|---|---|---|---|---|
| Adéquation fonctionnelle | Exigences opérationnelles en production | Inscription, auth, catalogue, progression, évaluation, RGPD | Scénario de bout en bout, [04-api.md §4.3](04-api.md) | Vérifié en local |
| Fiabilité | Disponibilité ≥ 90 %, aucune erreur bloquante | Health check Docker, redémarrage automatique, sauvegarde avant chaque déploiement | Sonde externe au 3ᵉ mois | À mesurer |
| Sécurité | HTTPS, BCrypt, JWT, aucun secret dans le code | TLS 1.2/1.3, BCrypt coût 12, JWT HMAC-SHA256, secrets par variables d'environnement, démarrage refusé si la clé fait moins de 32 caractères | Tests `JwtServiceTest`, revue de configuration | Vérifié |
| Utilisabilité | Inscription et première leçon sans aide | Parcours en trois écrans, catalogue lisible sans compte | Observation pendant le pilote | À mesurer |
| Accessibilité | WCAG 2.1 AA | Voir §7.3 | Audit automatisé et manuel | À auditer |
| Maintenabilité | Couverture backend ≥ 40 %, API documentée | Découpage par domaine, OpenAPI, contrôle JaCoCo bloquant en CI | `mvn verify` : **59,9 %** de lignes, 43 tests | Vérifié |
| Portabilité | Navigateurs récents, PWA installable | Manifeste, service worker, icônes *maskable*, Ionic | Build de production ; test sur Realme C67 | Build vérifié, appareil à tester |
| Qualité académique | Contenu correct et progressif | 30 leçons issues des cours de l'auteur, validation automatique de cohérence | `generate_seed.py --check`, contrôles SQL | Vérifié |
| Conformité | RGPD | Voir §7.2 | Textes légaux publiés, revue de minimisation | Vérifié en local |

## 7.2 RGPD — Règlement (UE) 2016/679

| Principe ou droit | Article | Mise en œuvre |
|---|---|---|
| Minimisation | 5.1.c | Seuls adresse, nom d'affichage libre, empreinte du mot de passe et langue sont stockés. Aucune nationalité, aucun pays, aucun statut administratif. |
| Limitation de la conservation | 5.1.e | Données conservées tant que le compte existe ; effacement immédiat et en cascade à la suppression. |
| Intégrité et confidentialité | 5.1.f, 32 | HTTPS, BCrypt, base non exposée, sauvegardes en accès restreint (`chmod 600`). |
| Consentement explicite | 7 | Case non pré-cochée, refus serveur (400) en son absence ; version et date du consentement stockées. |
| Information | 13 | Politique de confidentialité EN/FR servie par l'API, liée depuis l'inscription et le menu. |
| Droit d'accès | 15 | `GET /api/v1/me`, page « Mon profil ». |
| Droit de rectification | 16 | `PUT /api/v1/me`. |
| Droit à l'effacement | 17 | `DELETE /api/v1/me`, bouton avec double confirmation. Vérifié : le jeton devient inutilisable. |
| Protection dès la conception | 25 | Mesure d'audience auto-hébergée, aucun traceur ni CDN tiers, journaux sans adresse électronique. |
| Hébergement | 44 et s. | VPS OVHcloud dans l'Union européenne : aucun transfert hors UE. |

Points à traiter avant la mise en ligne publique :

- tenir un **registre des traitements** (modèle simplifié de la CNIL ou de l'AEPD) ;
- choisir un datacenter OVHcloud européen lors de la commande du VPS ;
- faire relire la politique de confidentialité — les textes fournis sont une base rédigée pour ce
  service, non un avis juridique.

## 7.3 Accessibilité — WCAG 2.1 niveau AA

Mesures intégrées dans le code :

| Critère | Mise en œuvre |
|---|---|
| 1.3.1 Information et relations | Titres hiérarchisés, sections reliées à leur titre (`aria-labelledby`), listes de définitions pour le vocabulaire |
| 1.4.3 Contraste minimum | Couleur principale `#2547d8` sur blanc : rapport 5,9:1 |
| 1.4.4 Redimensionnement du texte | Zoom jusqu'à 500 % autorisé (`maximum-scale=5.0`), unités relatives |
| 1.4.10 Reflow | Mise en page fluide ; les tableaux de conjugaison défilent dans leur propre cadre |
| 2.1.1 Clavier | Composants Ionic natifs, aucun gestionnaire uniquement souris |
| 2.3.3 Animations | `prefers-reduced-motion` respecté |
| 2.4.1 Contourner des blocs | Lien « Aller au contenu principal » révélé au focus |
| 2.4.7 Focus visible | Contour de 3 px, jamais supprimé |
| 3.1.1 Langue de la page | Attribut `lang` du document mis à jour à chaque changement de langue |
| 3.3.1 / 3.3.3 Erreurs de saisie | Messages explicites, annoncés par `role="alert"` |
| 4.1.3 Messages d'état | Verdicts d'exercice annoncés par `role="status"` |

À réaliser pour valider le critère d'évaluation « conformité WCAG 2.1 AA » :

1. audit automatisé Lighthouse et axe DevTools sur les huit pages ;
2. navigation complète au clavier seul : inscription → leçon → exercice → progression ;
3. parcours avec NVDA (Windows) et TalkBack (Realme C67) ;
4. consigner les écarts et leurs corrections dans le rapport de l'Avance 3.

Limite connue : les vidéos d'appui sont des ressources YouTube externes dont les sous-titres ne
dépendent pas du projet. Le contenu textuel de chaque section reste suffisant sans la vidéo.

## 7.4 Indicateurs d'évaluation — suivi

| Indicateur | Minimum | Aspirationnel | Situation au 12/09/2026 |
|---|---|---|---|
| Leçons fonctionnelles publiées | 10 | 30 | 30 rédigées et chargées en base locale |
| Couverture de tests backend | ≥ 40 % | ≥ 70 % | 59,9 % |
| Utilisateurs inscrits | 10 | 30 | après mise en production |
| Participants au pilote | 5 | 10 | recrutement à lancer au 2ᵉ mois |
| Disponibilité | ≥ 90 % | ≥ 95 % | après mise en production |
| Satisfaction pilote | ≥ 60 % | ≥ 85 % | questionnaire à préparer |
| Livraisons dans les délais | 3 / 3 | 3 / 3 | Avance 1 : 30/09/2026 |
| WCAG 2.1 AA | sans erreur critique | conformité complète | audit à réaliser |
