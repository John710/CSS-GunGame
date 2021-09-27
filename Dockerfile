FROM threesquared/docker-css-server-gungame-turbo:latest

EXPOSE 27015
EXPOSE 27005

ADD server.cfg /home/steam/server/cstrike/cfg/server.cfg
ADD maps.zip /home/steam/maps.zip

RUN unzip /home/steam/maps.zip -d /home/steam/server/maps

RUN ls /home/steam/server/maps -1 | sed 's/\(.*\)\..*/\1/' | sort | uniq > /home/steam/server/cstrike/cfg/mapcycle.txt
