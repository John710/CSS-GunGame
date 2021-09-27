FROM threesquared/docker-css-server-gungame-turbo:latest

EXPOSE 27015
EXPOSE 27005

USER root
COPY server.cfg /home/steam/server/cstrike/cfg/server.cfg
COPY maps.zip /home/steam/maps.zip
RUN chown steam:steam /home/steam/server/cstrike/cfg/server.cfg
RUN chown steam:steam /home/steam/maps.zip
RUN chown steam:steam /home/steam/server/cstrike/cfg/mapcycle.txt
RUN unzip /home/steam/maps.zip -d /home/steam/server/cstrike/maps
RUN chown -R steam:steam /home/steam/server/cstrike/maps

USER steam

RUN ls /home/steam/server/cstrike/maps/*.bsp -1 | rev | cut -d"/" -f1 | rev | sed 's/\(.*\)\.bsp/\1/' | sort | uniq > /home/steam/server/cstrike/cfg/mapcycle.txt
