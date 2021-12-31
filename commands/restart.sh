#!/bin/bash

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is down, can't restart" && exit 0

executeCommand() {
  screen -S server -X stuff "$1^M"
}

printRestartInMinutes() {
  msg="Server-restart-in-$1"
  executeCommand "servermsg $msg"
}

printAskToDisconnect() {
  msg="Per-favore-disconnettiti-per-un-paio-di-minuti"
  executeCommand "servermsg $msg"
}

printRestartInMinutes "10-minuti"
sleep 5m
printRestartInMinutes "5-minuti"
sleep 4m

printAskToDisconnect
sleep 1m

exit 1

