#!/bin/bash

serverDirPath=$1

cd

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is already up and running" && exit

# kill server screen
screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

echo "Creating server screen"
screen -S server

cd "$serverDirPath" || (echo "Can't cd into server folder. Abort." && exit)

echo "Starting server"
./start-server.sh

screen -d

echo "Server started"
