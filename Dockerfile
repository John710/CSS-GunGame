FROM steamcmd/steamcmd:latest

WORKDIR /game
EXPOSE 27015

RUN apt-get update && apt-get install -y git rsync wget nano
COPY ./server.cfg /game/cstrike/server.cfg
COPY ./maps.zip /game/maps.zip
COPY ./start.sh /game/start.sh
RUN chmod +x /game/start.sh
RUN apt-get clean -y && apt-get autoremove -y

ENTRYPOINT [ "/game/start.sh" ]
