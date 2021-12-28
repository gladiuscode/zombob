#!/bin/bash

serverDirPath=$1

executeCommand() {
  screen -S server -X stuff "$1^M"
}

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is already up and running" && exit

# kill server screen
screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

cd

screen -dmS server

executeCommand "cd $serverDirPath"
sleep 2s
executeCommand "./start-server.sh"

echo "Server started"
