FROM threesquared/docker-css-server-gungame-turbo:latest

EXPOSE 27015
EXPOSE 27005

COPY server.cfg /home/steam/server/cstrike/cfg/server.cfg
COPY maps.zip /home/steam/maps.zip

RUN ls -la /home/steam

RUN unzip /home/steam/maps.zip -d /home/steam/server/maps

RUN ls /home/steam/server/maps -1 | sed 's/\(.*\)\..*/\1/' | sort | uniq > /home/steam/server/cstrike/cfg/mapcycle.txt
