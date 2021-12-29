#!/bin/bash

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

# check server running status
serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is down, can't restart" && exit 1

printRestartInMinutes "10-minuti"
sleep 5s
printRestartInMinutes "5-minuti"
sleep 4s

printAskToDisconnect
sleep 30s

exit 0

