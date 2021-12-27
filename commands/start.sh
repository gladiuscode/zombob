#!/bin/bash

serverDirPath=$1

echo "$serverDirPath"

echo "Creating server screen"
screen -S server

cd "$serverDirPath" || echo "Can't cd into server folder. Abort." && exit

echo "Starting server"
./start-server.sh

screen -D

echo "Server started"
