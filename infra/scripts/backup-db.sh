#!/usr/bin/env bash
# =====================================================================
# Sauvegarde quotidienne de la base PostgreSQL de production.
#
# Planification (crontab de l'utilisateur de déploiement) :
#   30 3 * * * /opt/fva/infra/scripts/backup-db.sh >> /var/log/fva-backup.log 2>&1
#
# Stratégie : dump compressé horodaté, rotation sur 14 jours, vérification
# d'intégrité immédiate. Une sauvegarde jamais relue n'est pas une sauvegarde.
# =====================================================================
set -euo pipefail

PROJECT_DIR="${PROJECT_DIR:-/opt/fva}"
BACKUP_DIR="${BACKUP_DIR:-$PROJECT_DIR/infra/backups}"
RETENTION_DAYS="${RETENTION_DAYS:-14}"
COMPOSE_FILE="$PROJECT_DIR/docker-compose.prod.yml"

# shellcheck disable=SC1091
set -a; source "$PROJECT_DIR/.env"; set +a

timestamp="$(date +%Y-%m-%d_%H%M)"
target="$BACKUP_DIR/fva_${timestamp}.dump"

mkdir -p "$BACKUP_DIR"
chmod 700 "$BACKUP_DIR"

echo "[$(date -Is)] Début de la sauvegarde vers $target"

# Format « custom » : compressé, et restaurable table par table avec pg_restore.
docker compose -f "$COMPOSE_FILE" exec -T db \
    pg_dump --format=custom --no-owner --username="$POSTGRES_USER" "$POSTGRES_DB" > "$target"

# Vérification : pg_restore doit pouvoir lire la table des matières du dump.
if ! docker compose -f "$COMPOSE_FILE" exec -T db pg_restore --list < "$target" > /dev/null; then
    echo "[$(date -Is)] ERREUR : le fichier de sauvegarde est illisible." >&2
    rm -f "$target"
    exit 1
fi

chmod 600 "$target"
size="$(du -h "$target" | cut -f1)"
echo "[$(date -Is)] Sauvegarde vérifiée ($size)"

# Rotation.
find "$BACKUP_DIR" -name 'fva_*.dump' -type f -mtime "+$RETENTION_DAYS" -print -delete

echo "[$(date -Is)] Terminé."
