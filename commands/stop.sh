#!/bin/bash

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is already down" && exit 0

SHOULD_WAIT_AND_SAVE=$1

executeCommand() {
  screen -S server -X stuff "$1^M"
}

save() {
  echo "Saving current world"
  executeCommand "save"
  sleep 10s
  echo "Current world saved"
}

quit() {
  echo "Stopping server"
  executeCommand "quit"
  sleep 5s
  echo "Server stopped"
}

if [ -z "$SHOULD_WAIT_AND_SAVE" ] || [ "$SHOULD_WAIT_AND_SAVE" == "Y" ] || [ "$SHOULD_WAIT_AND_SAVE" == "y" ]
then
  QUIT_MESSAGE="servermsg Il-server-si-spegnerà-tra-"

  echo "Waiting 5 minutes..."
  executeCommand "${QUIT_MESSAGE}5-minuti"
  sleep 5m

  save

  executeCommand "${QUIT_MESSAGE}5-secondi"
  sleep 1s
  executeCommand "${QUIT_MESSAGE}4-secondi"
  sleep 1s
  executeCommand "${QUIT_MESSAGE}3-secondi"
  sleep 1s
  executeCommand "${QUIT_MESSAGE}2-secondi"
  sleep 1s
  executeCommand "${QUIT_MESSAGE}1-secondo"
  sleep 1s

  quit

  exit 1
fi

save

quit

screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

exit 1
