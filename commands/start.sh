#!/bin/bash

$serverDirPath=$1

echo "Creating server screen"
screen -S server

cd $serverDirPath

echo "Starting server"
./start-server.sh

screen -D 

echo "Server started"