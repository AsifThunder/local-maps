FROM eclipse-temurin:21-jre-alpine

# Set working dir
WORKDIR /app

# Download only the needed JARs
RUN apk add --no-cache wget bash curl \
 && mkdir -p /app/planetiler \
 && wget -q https://github.com/onthegomap/planetiler/releases/download/v0.9.0/planetiler.jar -O /app/planetiler/planetiler.jar

COPY run.sh /run.sh
RUN chmod +x /*.sh

ENTRYPOINT ["/bin/bash"]
