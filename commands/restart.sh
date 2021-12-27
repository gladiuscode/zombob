#!/bin/bash

executeCommandOnServer() {
  screen -S server -X stuff $1
}

printRestartInMinutes() {
  msg="Server-restart-in-$1"
  executeCommandOnServer "servermsg $msg^M"
}

printAskToDisconnect() {
  msg="Per-favore-disconnettiti-per-un-paio-di-minuti"
  executeCommandOnServer "servermsg $msg^M"
}

# check server running status
serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is down, can't restart" && exit

printRestartInMinutes "10-minuti"
sleep 5m
printRestartInMinutes "5-minuti"
sleep 4m

printAskToDisconnect
sleep 30s

# stop server
./stop.sh
sleep 10s

# create backup
./create-backup.sh
sleep 10s

# start server
./start.sh
sleep 10s


