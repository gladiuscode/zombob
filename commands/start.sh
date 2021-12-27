#!/bin/bash

serverDirPath=$1

cd

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is already up and running" && exit

# kill server screen
screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

screen -dmS server

screen -r server

cd "$serverDirPath" || (echo "Can't cd into server folder. Abort." && exit)

./start-server.sh
sleep 30s

screen -d

echo "Server started"
