FROM steamcmd/steamcmd:latest

WORKDIR /game
EXPOSE 27015

RUN apt-get update && apt-get install -y git rsync
COPY ./server.cfg /game/cfg/server.cfg
COPY ./maps.zip /game/maps.zip
RUN apt-get clean -y && apt-get autoremove -y

ENTRYPOINT [ "/game/start.sh" ]
