FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN apk add --no-cache wget bash curl \
 && mkdir -p /app/photon \
 && wget -q https://github.com/komoot/photon/releases/download/0.6.2/photon-0.6.2.jar -O /app/photon/photon.jar

COPY run.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/bin/bash"]
