FROM ghcr.io/project-osrm/osrm-backend

RUN mkdir -p /data && \
    wget -P /data https://download.geofabrik.de/south-america/brazil/nordeste-latest.osm.pbf && \
    osrm-extract -p /opt/car.lua /data/nordeste-latest.osm.pbf && \
    osrm-partition "/data/nordeste-latest" && \
    osrm-customize "/data/nordeste-latest"
