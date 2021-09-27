FROM threesquared/docker-css-server-gungame-turbo:latest

EXPOSE 27015
EXPOSE 27005

ADD server.cfg /home/steam/server/cstrike/cfg/server.cfg
