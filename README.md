# Overview

Local Maps has it all locally.

The web UI and the routing is from GraphHopper, the address search is from photon
and the tiles are created by planetiler and served by tilesserver-gl.

# Installation

1. edit .env and use the data you want or just start with the default (Austria)
2. `docker compose up --build` 
3. wait and ensure all services are properly started:
   1. graphhopper should say `"... INFO org.eclipse.jetty.server.Server - Started Server..."`
   2. planetiler should be finished and say `"local-maps-planetiler-1  ... Acknowledgments"`
   3. photon should say `"... de.komoot.photon.App - ES cluster is now ready"`
   4. geocoder-converter should say `"... org.eclipse.jetty.server.Server: Started..."`
   5. tileserver should say `"Listening at http://[::]:8080/"`
   6. ui should say `"Loopback: http://localhost:3000/"`
4. View GraphHopper Maps at http://localhost:3000

The step 2 is rather demanding as all files and images are downloaded and built in
parallel. You can reduce demand if you start them one by one using:

`docker compose up --build <service>`

Ensure that you consider the dependencies: `planetiler, tilerserver, graphhopper, photon, geocoder-converter, ui`.

## Development

Start over:

1. `docker compose down -v`
2. `docker compose down --rmi all`