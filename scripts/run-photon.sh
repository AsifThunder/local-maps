#!/bin/bash
set -e

PHOTON_DB_PATH="/data/photon-db.tar.bz2"
PHOTON_EXTRACTED_PATH="/data/photon_data"

echo "===> Starting Photon setup"

# Download only if archive doesn't exist
if [ ! -f "$PHOTON_DB_PATH" ]; then
  echo "===> Downloading Photon DB from $PHOTON_DB"
  wget --progress=bar:force:noscroll "$PHOTON_DB" -O "$PHOTON_DB_PATH"
else
  echo "===> Photon DB archive already exists, skipping download"
fi

# Extract only if not already extracted
if [ ! -d "$PHOTON_EXTRACTED_PATH" ]; then
  echo "===> Extracting Photon DB..."
  mkdir -p "$PHOTON_EXTRACTED_PATH"
  tar -xjf "$PHOTON_DB_PATH" -C "$PHOTON_EXTRACTED_PATH" --strip-components=1
else
  echo "===> Photon DB already extracted, skipping"
fi

# Run photon with extracted DB
echo "===> Starting Photon..."
cd /app/photon
java -Xmx2g -jar photon.jar -data-dir /data -listen-ip 0.0.0.0
