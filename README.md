# Overview

mymaps where 'my' is in the sense of 'local'.

The web UI and the routing is from GraphHopper, the address search is from photon
and the tiles are created by planetiler and served by tilesserver-gl.

# Installation

1. edit .env and use the data you want
2. `source .env; mkdir -p data; wget "$PBF_URL" -O data/input.osm.pbf`
3. `docker compose up --build`
4. wait and ensure all services are properly started:
   a) planetiler should say "planetiler-1  ... Acknowledgments"
   b) GraphHopper should say "... INFO org.eclipse.jetty.server.Server - Started Server..."
   c) likely the last is photon and it should show "... de.komoot.photon.App - ES cluster is now ready"
5. In another tab do: `cd ui; npm install; npm run serve`
6. Now view GraphHopper Maps at http://localhost:3000

## Troubleshooting

If you see "Error fetching source http://localhost:7070/styles/basic-preview/style.json"
in the browser just press Ctrl+C (wait until everything was stopped) and run `docker compose up --build` again.
See 1st TODO.

TODOs:
1. Tileserver fails too as mbtiles file does not exist yet but tileserver is already started
2. Instead of installation commands use docker or docker compose. But dependencies are tricky.

## Development

Start over:

1. `docker compose down -v`
2. `docker compose down --rmi all`