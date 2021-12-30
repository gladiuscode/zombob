#!/bin/bash

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is already up and running" && exit 0

SERVER_PATH=$1

executeCommand() {
  screen -S server -X stuff "$1^M"
}

screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

screen -dmS server

executeCommand "cd $SERVER_PATH"
executeCommand "./start-server.sh"

exit 1
