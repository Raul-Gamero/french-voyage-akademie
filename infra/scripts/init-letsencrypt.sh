#!/usr/bin/env bash
# =====================================================================
# Obtention du premier certificat Let's Encrypt.
#
# Nginx refuse de démarrer si le certificat référencé n'existe pas encore :
# on l'obtient donc une première fois en mode autonome, port 80 libre,
# avant tout lancement du service web. Les renouvellements sont ensuite
# assurés par le conteneur certbot de docker-compose.prod.yml.
# =====================================================================
set -euo pipefail

PROJECT_DIR="${PROJECT_DIR:-/opt/fva}"
cd "$PROJECT_DIR"

# shellcheck disable=SC1091
set -a; source .env; set +a

: "${FVA_PUBLIC_DOMAIN:?FVA_PUBLIC_DOMAIN doit être défini dans .env}"
: "${FVA_LETSENCRYPT_EMAIL:?FVA_LETSENCRYPT_EMAIL doit être défini dans .env}"

mkdir -p infra/certbot/conf infra/certbot/www

if [[ -d "infra/certbot/conf/live/$FVA_PUBLIC_DOMAIN" ]]; then
    echo "Un certificat existe déjà pour $FVA_PUBLIC_DOMAIN : rien à faire."
    exit 0
fi

# Le service web ne doit pas occuper le port 80 pendant la validation.
docker compose -f docker-compose.prod.yml stop web 2>/dev/null || true

docker run --rm -p 80:80 \
    -v "$PROJECT_DIR/infra/certbot/conf:/etc/letsencrypt" \
    -v "$PROJECT_DIR/infra/certbot/www:/var/www/certbot" \
    certbot/certbot certonly --standalone \
    --non-interactive --agree-tos \
    --email "$FVA_LETSENCRYPT_EMAIL" \
    -d "$FVA_PUBLIC_DOMAIN" -d "www.$FVA_PUBLIC_DOMAIN"

echo "Certificat obtenu. Lancement : docker compose -f docker-compose.prod.yml up -d --build"
