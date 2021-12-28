#!/bin/bash

executeCommand() {
  screen -S server -X stuff "$1^M"
}

quitMessage="servermsg Il-server-si-spegnerà-tra-"

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is already down" && exit

cd

echo "Waiting 5 minutes..."
executeCommand "${quitMessage}5-minuti"
sleep 5m

echo "Saving current world"
executeCommand "save"
sleep 10s
echo "Current world saved"

executeCommand "${quitMessage}5-secondi"
sleep 1s
executeCommand "${quitMessage}4-secondi"
sleep 1s
executeCommand "${quitMessage}3-secondi"
sleep 1s
executeCommand "${quitMessage}2-secondi"
sleep 1s
executeCommand "${quitMessage}1-secondo"
sleep 1s

echo "Stopping server"
executeCommand "quit"
sleep 5s
echo "Server stopped"

screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill


