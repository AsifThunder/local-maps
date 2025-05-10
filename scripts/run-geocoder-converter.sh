#!/bin/bash
set -e

cd /app/geocoder-converter
java -Xmx100m -jar geocoder-converter.jar server config.yml