FROM eclipse-temurin:21-jre-alpine

# Set working dir
WORKDIR /app

# Download only the needed JARs
RUN apk add --no-cache wget bash curl \
 && mkdir -p /app/graphhopper \
 && wget -q https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/10.0/graphhopper-web-10.0.jar -O /app/graphhopper/graphhopper-web.jar

COPY run.sh /run.sh
RUN chmod +x /*.sh

ENTRYPOINT ["/bin/bash"]
