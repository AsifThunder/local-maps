FROM node:22-alpine AS build

# Install required dependencies for building
RUN apk add --no-cache \
    python3 \
    make \
    g++

RUN npm install -g axios tileserver-gl-light && \
    npm cache clean --force

# Second stage: Runtime image
FROM node:22-alpine

# Install runtime dependencies only
RUN apk add --no-cache \
    libstdc++ \
    ca-certificates

COPY --from=build /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=build /usr/local/bin/tileserver-gl-light /usr/local/bin/
COPY config.json /config.json

# Create directory for data
RUN mkdir -p /data

# Set environment variables
ENV NODE_ENV=production
ENV CORS_ORIGINS=*
ENV CACHE_SIZE=10

CMD ["tileserver-gl", "--config", "/config.json"]