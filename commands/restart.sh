#!/bin/bash

TO_UPDATE=$1

executeCommand() {
  screen -S server -X stuff "$1^M"
}

printRestartInMinutes() {
  msg="\"Server restart in $1\""
  executeCommand "servermsg $msg"
}

printAskToDisconnect() {
  msg="\"Per favore disconnettiti per un paio di minuti\""
  executeCommand "servermsg $msg"
}

if [ -z "$TO_UPDATE" ]
then
  printRestartInMinutes "10 minuti"
  sleep 3m
  printRestartInMinutes "7 minuti"
  sleep 2m
  printRestartInMinutes "5 minuti"
  sleep 2m
  printRestartInMinutes "3 minuti"
  sleep 2m

  printAskToDisconnect
  sleep 1m

  exit 1
fi

printRestartInMinutes "5 minuti"
sleep 1m
printRestartInMinutes "4 minuti"
sleep 1m
printRestartInMinutes "3 minuti"
sleep 1m
printRestartInMinutes "2 minuti"
sleep 1m
printRestartInMinutes "1 minuto"
sleep 1m

printAskToDisconnect
sleep 1m

exit 1

