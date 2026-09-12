# 5. Déploiement et exploitation

Cible : un VPS OVHcloud sous Debian ou Ubuntu, Docker et le plugin Compose installés, nom de domaine
pointant vers l'adresse IP du serveur.

## 5.0 Pointer le domaine GoDaddy vers le VPS

Dans GoDaddy : *Mes produits → Domaine → DNS → Gérer les enregistrements DNS*.

| Type | Nom | Valeur | TTL |
|---|---|---|---|
| A | `@` | adresse IPv4 du VPS | 600 secondes |
| A | `www` | adresse IPv4 du VPS | 600 secondes |

Supprimer l'enregistrement A « Parked » créé par défaut et toute redirection de domaine
(*Forwarding*). Les deux noms sont indispensables : le certificat est demandé pour le domaine et pour
`www`, et Let's Encrypt refuse s'il n'arrive pas à joindre l'un des deux.

Vérifier la propagation avant d'aller plus loin : `nslookup mondomaine.com` doit renvoyer l'IP du VPS.

**TLS :** aucun certificat à acheter chez GoDaddy. Le certificat Let's Encrypt est gratuit, émis et
renouvelé automatiquement par le conteneur `certbot`. Il suffit que le DNS pointe vers le VPS, que
les ports 80 et 443 soient ouverts et qu'une adresse de notification figure dans `.env`.

## 5.1 Préparation du serveur (une seule fois)

Commandes pour Ubuntu 24.04 (connecté en SSH avec l'utilisateur fourni par OVHcloud).

```bash
# Docker et Compose depuis les dépôts Ubuntu
sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io docker-compose-v2 git ufw

# Mémoire d'échange : la compilation Maven et Angular dépasse 2 Go sur un petit VPS
sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Utilisateur de déploiement sans mot de passe root
sudo adduser --disabled-password fva
sudo usermod -aG docker fva

# Pare-feu : seuls SSH, HTTP et HTTPS
sudo ufw allow OpenSSH
sudo ufw allow 80,443/tcp
sudo ufw enable

# Code
sudo mkdir -p /opt/fva && sudo chown fva:fva /opt/fva
sudo -u fva git clone https://github.com/Raul-Gamero/french-voyage-akademie.git /opt/fva
```

## 5.2 Configuration

```bash
cd /opt/fva
cp .env.example .env
chmod 600 .env
```

Valeurs à renseigner impérativement :

| Variable | Exigence |
|---|---|
| `POSTGRES_PASSWORD` | aléatoire, 32 caractères — `openssl rand -base64 32` |
| `FVA_JWT_SECRET` | aléatoire, 48 caractères ou plus — `openssl rand -base64 48` |
| `MATOMO_DB_PASSWORD` | aléatoire |
| `FVA_PUBLIC_DOMAIN` | domaine public, sans `https://` |
| `FVA_LETSENCRYPT_EMAIL` | adresse de notification d'expiration |
| `SPRING_PROFILES_ACTIVE` | `prod` |

`FVA_ADMIN_EMAIL` et `FVA_ADMIN_PASSWORD` restent vides : `docker-compose.prod.yml` les force à vide
pour qu'aucun compte par défaut n'existe sur une installation publique.

## 5.3 Premier lancement

```bash
chmod +x infra/scripts/*.sh
./infra/scripts/init-letsencrypt.sh
docker compose -f docker-compose.prod.yml up -d --build
docker compose -f docker-compose.prod.yml logs -f backend
```

Attendre la ligne `Successfully applied 5 migrations`, puis vérifier :

```bash
curl -s https://$FVA_PUBLIC_DOMAIN/actuator/health
curl -s "https://$FVA_PUBLIC_DOMAIN/api/v1/catalog/levels?locale=fr"
```

## 5.4 Sauvegardes

```bash
crontab -e
```

```
30 3 * * * /opt/fva/infra/scripts/backup-db.sh >> /var/log/fva-backup.log 2>&1
```

- dump PostgreSQL au format *custom*, relu par `pg_restore --list` avant d'être conservé ;
- rotation sur 14 jours ;
- **copie hors serveur recommandée** : une sauvegarde sur le même disque ne protège pas d'une perte du
  VPS. Option gratuite : `rclone` vers un stockage personnel, ou le stockage objet OVHcloud.

Restauration : `./infra/scripts/restore-db.sh infra/backups/fva_AAAA-MM-JJ_HHMM.dump`.
**Tester une restauration au moins une fois pendant le projet** — c'est l'élément de preuve attendu
pour le critère de fiabilité.

## 5.5 Déploiement continu

Le job `deploy` de [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) s'exécute sur chaque push
sur `main`, uniquement si les tests backend, la validation du contenu, l'application des migrations et
le build frontend ont réussi. Il appelle [`infra/scripts/deploy.sh`](../infra/scripts/deploy.sh) par SSH,
qui sauvegarde la base, reconstruit, redémarre, puis attend que `/actuator/health` réponde `UP`.

Le job est **désactivé par défaut** : il ne s'exécute que si la variable de dépôt `DEPLOY_ENABLED`
vaut `true` (*Settings → Secrets and variables → Actions → Variables*). À activer une fois le VPS
prêt et les secrets ci-dessous créés ; tant qu'elle est absente, le job apparaît comme ignoré et la CI
reste verte.

Secrets à créer dans *Settings → Environments → production* :

| Secret | Contenu |
|---|---|
| `VPS_HOST` | adresse du serveur |
| `VPS_USER` | `fva` |
| `VPS_SSH_KEY` | clé privée dédiée au déploiement (générée pour cet usage seul) |
| `VPS_SSH_KNOWN_HOSTS` | sortie de `ssh-keyscan <adresse>` |

## 5.6 Mesure d'audience

Matomo écoute sur `127.0.0.1:8081` et n'est jamais exposé publiquement :

```bash
ssh -L 8081:localhost:8081 fva@<adresse-du-vps>
```

puis ouvrir http://localhost:8081 pour l'assistant d'installation. Dans les réglages, activer
l'anonymisation des adresses IP (deux octets) et le respect de *Do Not Track*.

## 5.7 Supervision de la disponibilité

L'objectif engagé est une disponibilité d'au moins 90 % au troisième mois. Pour la mesurer
gratuitement, configurer une sonde externe (UptimeRobot ou équivalent) sur
`https://<domaine>/actuator/health` à intervalle de 5 minutes, et exporter son rapport pour l'Avance 3.

## 5.8 Mise à jour du contenu en production

1. Modifier `content/a1/unit-N.json`.
2. `python tools/generate_seed.py` régénère la migration de l'unité.
3. **Une migration déjà appliquée ne doit jamais être modifiée** : Flyway refuserait de démarrer
   (somme de contrôle différente). Pour corriger une leçon déjà publiée, créer une migration corrective
   `V6__correction_…sql` contenant des `UPDATE` ciblés.

La régénération complète d'une unité n'est donc possible que tant qu'elle n'a pas été déployée.
