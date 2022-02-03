#!/bin/bash

restart() {
  logger "[ ZOMBOB : INFO ] > Server restart started"

  checkServerStatus "down"

  TO_UPDATE=$1

  printRestartInMinutes() {
    MESSAGE="Server restart in $1"

    if [ "$TO_UPDATE" == "toUpdate" ]
    then
      MESSAGE="Aggiornamento mods necessario. Restart in $1"
    fi

    sendServerMessage "$MESSAGE"
  }

  printAskToDisconnect() {
    MESSAGE="Per favore disconnettiti per un paio di minuti"
    sendServerMessage "$MESSAGE"
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
  else
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
  fi

  actionSelector "stop" "skipWait"
  actionSelector "create-backup"
  actionSelector "start"

  logger "[ ZOMBOB : INFO ] > Server restart completed"
}
