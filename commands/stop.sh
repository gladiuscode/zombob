#!/bin/bash

cd

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is already down" && exit

echo "Saving current world"
screen -S server -X stuff "save^M"
sleep 10s
echo "Current world saved"

screen -S server -X stuff "servermsg Il-server-si-spegnerà-tra-pochi-secondi^M"
sleep 5s

screen -S server -X stuff "servermsg Il-server-si-spegnerà-tra-5-secondi^M"
sleep 1s
screen -S server -X stuff "servermsg Il-server-si-spegnerà-tra-4-secondi^M"
sleep 1s
screen -S server -X stuff "servermsg Il-server-si-spegnerà-tra-3-secondi^M"
sleep 1s
screen -S server -X stuff "servermsg Il-server-si-spegnerà-tra-2-secondi^M"
sleep 1s
screen -S server -X stuff "servermsg Il-server-si-spegnerà-tra-1-secondo^M"
sleep 1s

echo "Stopping server"
screen -S server -X stuff "quit^M"
sleep 5s
echo "Server stopped"

# kill server screen
screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill


