#!/bin/bash

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is already down" && exit 0

TO_STOP="toStop"
TO_UPDATE="toUpdate"
SKIP_WAIT="skipWait"
ARG=$1 || $TO_STOP

getServerMsg() {
  if [ "$ARG" == $TO_UPDATE ]
  then
    echo "servermsg Il-server-si-riavvierà-per-aggiornamento-mods-tra-"
  fi
  echo "servermsg Il-server-si-spegnerà-tra-"
}

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

if [ "$ARG" != $SKIP_WAIT ]
then
  MESSAGE=getServerMsg
  echo "Waiting 5 minutes..."
  executeCommand "${MESSAGE}5-minuti"
  sleep 5m

  save

  executeCommand "${MESSAGE}5-secondi"
  sleep 1s
  executeCommand "${MESSAGE}4-secondi"
  sleep 1s
  executeCommand "${MESSAGE}3-secondi"
  sleep 1s
  executeCommand "${MESSAGE}2-secondi"
  sleep 1s
  executeCommand "${MESSAGE}1-secondo"
  sleep 1s

  quit

  screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

  exit 1
fi

save

quit

screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill

exit 1
