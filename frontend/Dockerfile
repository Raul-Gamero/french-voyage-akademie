# =====================================================================
# Frontend French Voyage Akademie — image de production
# Étape 1 : compilation Angular. Étape 2 : Nginx sert la PWA, termine le
# TLS et relaie /api vers le backend. Un seul point d'entrée public.
# =====================================================================

# --- Étape 1 : compilation -------------------------------------------
FROM node:22-alpine AS build

WORKDIR /build

COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund

COPY . .
RUN npx ng build --configuration production

# --- Étape 2 : service -----------------------------------------------
FROM nginx:1.27-alpine

# Les modèles de /etc/nginx/templates sont passés à envsubst au démarrage :
# seules les variables d'environnement définies sont remplacées, les
# variables Nginx ($host, $uri…) restent intactes.
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY nginx/rate-limit.conf /etc/nginx/conf.d/00-rate-limit.conf
COPY nginx/security-headers.conf /etc/nginx/snippets/security-headers.conf
COPY nginx/proxy.conf /etc/nginx/snippets/proxy.conf
COPY --from=build /build/www /usr/share/nginx/html

EXPOSE 80 443
