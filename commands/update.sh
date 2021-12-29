#!/bin/bash

STEAMCMD_PATH=$1

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is up and running. Please close it" && exit

$STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

echo "Server update completed"
