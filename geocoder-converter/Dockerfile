FROM eclipse-temurin:21-jre-alpine

# Set working dir
WORKDIR /app

# Download only the needed JARs
RUN apk add --no-cache wget bash curl \
 && mkdir -p /app/geocoder-converter \
 && wget -q https://github.com/graphhopper/geocoder-converter/releases/download/0.2/graphhopper-geocoder-converter-0.2.jar -O /app/geocoder-converter/geocoder-converter.jar

COPY run.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/bin/bash"]
