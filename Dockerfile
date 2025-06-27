FROM ghcr.io/project-osrm/osrm-backend

RUN mkdir -p /data && \
    wget -P /data https://download.geofabrik.de/south-america/brazil-latest.osm.pbf && \
    osrm-extract -p /opt/car.lua /data/brazil-latest.osm.pbf && \
    osrm-partition "/data/brazil-latest" && \
    osrm-customize "/data/brazil-latest"
