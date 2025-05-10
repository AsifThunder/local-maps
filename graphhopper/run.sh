#!/bin/bash
set -e

if [ ! -d /data/graph-cache ]; then
  echo 'import' > /data/graphhopper.status.txt
  java -Xmx4g -Xms4g \
    -Ddw.graphhopper.datareader.file=/data/input.osm.pbf \
    -Ddw.graphhopper.graph.location=/data/graph-cache \
    -jar /app/graphhopper/graphhopper-web.jar import /app/graphhopper/config.yml
fi

echo 'starting' > /data/graphhopper.status.txt
java -Xmx2g \
  -Ddw.graphhopper.graph.location=/data/graph-cache \
  -jar /app/graphhopper/graphhopper-web.jar server /app/graphhopper/config.yml
