FROM eclipse-temurin:21-jre-alpine

# Set working dir
WORKDIR /app

# Download only the needed JARs
RUN apk add --no-cache wget bash curl \
 && mkdir -p /app/graphhopper /app/photon /app/geocoder-converter /app/planetiler \
 && wget -q https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/10.0/graphhopper-web-10.0.jar -O /app/graphhopper/graphhopper-web.jar \
 && wget -q https://github.com/komoot/photon/releases/download/0.6.2/photon-0.6.2.jar -O /app/photon/photon.jar \
 && wget -q https://github.com/graphhopper/geocoder-converter/releases/download/0.2/graphhopper-geocoder-converter-0.2.jar -O /app/geocoder-converter/geocoder-converter.jar \
 && wget -q https://github.com/onthegomap/planetiler/releases/download/v0.9.0/planetiler.jar -O /app/planetiler/planetiler.jar

# Copy the shell scripts that start each service
COPY scripts /scripts
RUN chmod +x /scripts/*.sh

ENTRYPOINT ["/bin/bash"]
