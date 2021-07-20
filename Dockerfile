FROM steamcmd/steamcmd:latest

WORKDIR /game

RUN apt-get update && apt-get install -y git rsync

RUN steamcmd +login anonymous +force_install_dir /game +app_update 232330 validate +exit
COPY ./server.cfg /game/server.cfg
EXPOSE 27015

ADD https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1145-linux.tar.gz /tmp/mmsource.tar.gz
RUN tar -xf /tmp/mmsource.tar.gz
ADD https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6510-linux.tar.gz /tmp/sourcemod.tar.gz
RUN tar -xf /tmp/sourcemod.tar.gz

RUN git clone https://github.com/altexdim/sourcemod-plugin-gungame.git /tmp/gungamefiles
RUN rm -rf /tmp/gungamefiles/README.md /tmp/gungamefiles/.git
RUN rsync --remove-source-files -a /tmp/gungamefiles/ /game/
RUN rm -rf /tmp/gungamefiles

ENTRYPOINT [ "./srcds_run", "-console", "-game", "cstrike", "+map", "de_dust", "-maxplayers", "16" ]
# ENTRYPOINT [ "ls", "-lar", "/game" ]
