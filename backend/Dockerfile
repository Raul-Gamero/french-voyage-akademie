# =====================================================================
# Backend French Voyage Akademie — image de production
# Construction en deux étapes : l'image finale ne contient ni Maven,
# ni le code source, ni le dépôt de dépendances.
# =====================================================================

# --- Étape 1 : compilation -------------------------------------------
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /build

# Les dépendances sont résolues avant la copie des sources : tant que
# le pom ne change pas, cette couche reste en cache et la construction
# suivante ne retélécharge rien.
COPY pom.xml .
# Solo precalienta la caché: si algún plugin no se resuelve aquí, la
# compilación siguiente lo descarga y falla de verdad si algo falta.
RUN mvn -B -q dependency:go-offline || true

COPY src ./src
RUN mvn -B clean package -DskipTests

# --- Étape 2 : exécution ---------------------------------------------
FROM eclipse-temurin:21-jre-alpine

# Le service ne tourne jamais en root.
RUN addgroup -S fva && adduser -S fva -G fva

WORKDIR /app
COPY --from=build /build/target/akademie-backend-*.jar app.jar
# /var/log/fva recibe el volumen de registros del perfil prod: debe existir y
# pertenecer al usuario del servicio antes de montarse.
RUN mkdir -p /var/log/fva && chown -R fva:fva /app /var/log/fva

USER fva
EXPOSE 8080

# Le VPS est modeste : on borne explicitement la mémoire de la JVM
# plutôt que de la laisser déduire une valeur du conteneur.
ENV JAVA_OPTS="-XX:MaxRAMPercentage=70 -XX:+UseSerialGC -Djava.security.egd=file:/dev/./urandom"

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
    CMD wget -qO- http://localhost:8080/actuator/health | grep -q '"status":"UP"' || exit 1

ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar app.jar"]
