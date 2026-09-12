#!/usr/bin/env bash
# =====================================================================
# Déploiement sur le VPS. Appelé par GitHub Actions via SSH, ou à la main.
#
# Ordre : récupérer le code, reconstruire, redémarrer, puis vérifier que
# l'API répond. En cas d'échec de la vérification, le script sort en erreur
# et la CI signale le déploiement comme raté.
# =====================================================================
set -euo pipefail

PROJECT_DIR="${PROJECT_DIR:-/opt/fva}"
BRANCH="${BRANCH:-main}"
cd "$PROJECT_DIR"

echo "[deploy] Mise à jour du dépôt ($BRANCH)"
git fetch --prune origin
git checkout "$BRANCH"
git reset --hard "origin/$BRANCH"

echo "[deploy] Sauvegarde préalable de la base"
./infra/scripts/backup-db.sh

echo "[deploy] Construction et redémarrage"
docker compose -f docker-compose.prod.yml up -d --build --remove-orphans

echo "[deploy] Vérification de l'état du backend"
for attempt in $(seq 1 30); do
    if docker compose -f docker-compose.prod.yml exec -T backend \
        wget -qO- http://localhost:8080/actuator/health 2>/dev/null | grep -q '"status":"UP"'; then
        echo "[deploy] Backend opérationnel (tentative $attempt)"
        docker image prune -f > /dev/null
        exit 0
    fi
    sleep 10
done

echo "[deploy] ÉCHEC : le backend ne répond pas après 5 minutes." >&2
docker compose -f docker-compose.prod.yml logs --tail=80 backend >&2
exit 1
