#!/usr/bin/env bash
# =====================================================================
# Restauration d'une sauvegarde produite par backup-db.sh.
#
#   ./infra/scripts/restore-db.sh infra/backups/fva_2026-11-20_0330.dump
#
# ATTENTION : remplace intégralement le contenu de la base de production.
# Le backend est arrêté pendant l'opération pour éviter toute écriture.
# =====================================================================
set -euo pipefail

if [[ $# -ne 1 || ! -f "$1" ]]; then
    echo "Usage : $0 <fichier.dump>" >&2
    exit 1
fi

PROJECT_DIR="${PROJECT_DIR:-/opt/fva}"
COMPOSE_FILE="$PROJECT_DIR/docker-compose.prod.yml"
DUMP="$1"

# shellcheck disable=SC1091
set -a; source "$PROJECT_DIR/.env"; set +a

read -r -p "Restaurer $DUMP sur la base « $POSTGRES_DB » ? Tapez RESTAURER pour confirmer : " answer
if [[ "$answer" != "RESTAURER" ]]; then
    echo "Annulé."
    exit 0
fi

docker compose -f "$COMPOSE_FILE" stop backend

docker compose -f "$COMPOSE_FILE" exec -T db \
    pg_restore --clean --if-exists --no-owner \
    --username="$POSTGRES_USER" --dbname="$POSTGRES_DB" < "$DUMP"

docker compose -f "$COMPOSE_FILE" start backend

echo "Restauration terminée. Vérifiez : curl -s https://$FVA_PUBLIC_DOMAIN/actuator/health"
