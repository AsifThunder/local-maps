#!/bin/bash
set -e

echo "===> Running Planetiler"

# Ensure output directory exists
mkdir -p /data

# Download the PBF if not already there
if [ ! -f /data/input.osm.pbf ]; then
  echo "===> Downloading PBF from $PBF_URL"
  wget -q "$PBF_URL" -O /data/input.osm.pbf
else
  echo "===> PBF already exists at /data/input.osm.pbf"
fi

# Run planetiler if --force is specified it will overwrite the data
java -Xmx4g -jar /app/planetiler/planetiler.jar \
  --download \ 
  --pbf /data/input.osm.pbf \
  --output /data/tiles.mbtiles
