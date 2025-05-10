#!/bin/bash
set -e

PHOTON_DB_PATH="/data/photon-db.tar.bz2"
PHOTON_EXTRACTED_PATH="/data/photon_data"

if [ ! -f "$PHOTON_DB_PATH" ]; then
  echo 'download' > /data/photon.status.txt
  wget --progress=bar:force:noscroll "$PHOTON_DB" -O "$PHOTON_DB_PATH"
else
  echo "Photon DB archive already exists, skipping download"
fi

# Extract only if not already extracted
if [ ! -d "$PHOTON_EXTRACTED_PATH" ]; then
  echo 'extract' > /data/photon.status.txt
  mkdir -p "$PHOTON_EXTRACTED_PATH"
  tar -xjf "$PHOTON_DB_PATH" -C "$PHOTON_EXTRACTED_PATH" --strip-components=1
else
  echo "Photon DB already extracted, skipping"
fi

echo 'starting' > /data/photon.status.txt
cd /app/photon
java -Xmx2g -jar photon.jar -data-dir /data -listen-ip 0.0.0.0
