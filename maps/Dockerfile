FROM node:20.14.0-alpine as builder

# Install git (required to clone a specific branch)
RUN apk add --no-cache git

RUN git clone --single-branch --branch local-maps https://github.com/graphhopper/graphhopper-maps.git /app

WORKDIR /app

RUN npm install

FROM node:20.14.0-alpine

# Install git because it's needed at runtime (for webpack)
RUN apk add --no-cache git
COPY --from=builder /app /app

WORKDIR /app

EXPOSE 3000

CMD ["npm", "run", "serve"]