#!/bin/bash

steamcmd +login anonymous +force_install_dir /game +app_update 232330 validate +exit

if [ ! -f ".installed" ]; then
    wget -O /tmp/mmsource.tar.gz https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1145-linux.tar.gz
    tar -xf /tmp/mmsource.tar.gz
    wget -O /tmp/sourcemod.tar.gz https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6510-linux.tar.gz
    tar -xf /tmp/sourcemod.tar.gz

    git clone https://github.com/altexdim/sourcemod-plugin-gungame.git /tmp/gungamefiles
    rm -rf /tmp/gungamefiles/README.md /tmp/gungamefiles/.git
    rsync --remove-source-files -a /tmp/gungamefiles/ /game/
    rm -rf /tmp/gungamefiles

    touch .installed
fi
/game/srcds_run -console -game cstrike +map de_dust -maxplayers 16