FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN apk add --no-cache wget bash curl \
 && mkdir -p /app/planetiler \
 && wget -q https://github.com/onthegomap/planetiler/releases/download/v0.9.0/planetiler.jar -O /app/planetiler/planetiler.jar

COPY run.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/bin/bash"]
