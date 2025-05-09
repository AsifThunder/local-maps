#!/bin/bash
set -e
cd /app/planetiler

echo "Running Planetiler..."
./build/install/planetiler/bin/planetiler \
  --download --pbf "${PBF_URL}" --output /data/tiles.mbtiles
