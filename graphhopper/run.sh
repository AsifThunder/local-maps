#!/bin/bash
set -e

echo "Running GraphHopper import (if needed)..."

if [ ! -d /data/graph-cache ]; then
  java -Xmx4g -Xms4g \
    -Ddw.graphhopper.datareader.file=/data/input.osm.pbf \
    -Ddw.graphhopper.graph.location=/data/graph-cache \
    -jar /app/graphhopper/graphhopper-web.jar import /app/graphhopper/config.yml
fi

echo "Starting GraphHopper server..."
java -Xmx4g -Xms4g \
  -Ddw.graphhopper.graph.location=/data/graph-cache \
  -jar /app/graphhopper/graphhopper-web.jar server /app/graphhopper/config.yml
