#!/bin/bash
set -e

mkdir -p /data

if [ ! -f /data/input.osm.pbf ]; then
  echo "Downloading PBF from $PBF_URL"
  echo 'download_pbf' > /data/planetiler.status.txt
  wget -q "$PBF_URL" -O /data/input.osm.pbf
else
  echo "PBF already exists at /data/input.osm.pbf"
fi

echo 'starting' > /data/planetiler.status.txt

# Run planetiler if --force is specified it will overwrite the data
java -Xmx4g -jar /app/planetiler/planetiler.jar --download --osm_path=/data/input.osm.pbf --output=/data/tiles.mbtiles

echo 'finished' > /data/planetiler.status.txt