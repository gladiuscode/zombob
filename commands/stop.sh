#!/bin/bash

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is already down" && exit 0

TO_STOP="toStop"
TO_UPDATE="toUpdate"
SKIP_WAIT="skipWait"
ARG=$1

computeServerMessage() {
  if [ "$ARG" == $TO_UPDATE ]
  then
    MESSAGE="servermsg Il-server-si-riavvierà-per-aggiornamento-mods-tra-"
    return
  fi
  MESSAGE="servermsg Il-server-si-spegnerà-tra-"
}

killServer() {
  screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill
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
  computeServerMessage

  echo "Waiting 5 minutes..."
  executeCommand "${MESSAGE}5-minuti"
  sleep 4m

  echo "Saving..."
  executeCommand "Per-favore-disconnettiti-per-un-paio-di-minuti"
  save
  sleep 1m

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

  echo "Quitting..."
  quit
  killServer

  exit 1
fi

save
quit
killServer

exit 1
