#!/bin/bash

restart() {
  logger "[ RESTART ] START"

  checkServerStatus "down"

  trackStatus "restarting"

  local TO_UPDATE="toUpdate"
  local TO_CLEAN_UP="cleanUp"

  local TRACK_STATUS
  [ "$1" == "TO_UPDATE" ] && TRACK_STATUS="aggiornamento mods" || TRACK_STATUS="riavvio programmato"
  trackStatus "$TRACK_STATUS"

  if [ "$1" == "$TO_CLEAN_UP" ]
  then
    cleanUpPlayersStatistics
  fi

  printRestartInMinutes() {
    local MESSAGE="Server restart in $1"

    if [ "$1" == "$TO_UPDATE" ]
    then
      local MESSAGE="Aggiornamento mods necessario. Restart in $1"
    fi

    sendServerMessage "$MESSAGE"
  }

  printAskToDisconnect() {
    local MESSAGE="Per favore disconnettiti per un paio di minuti"
    sendServerMessage "$MESSAGE"
  }

  executeOutro() {
    actionSelector "stop" "skipWait"
    actionSelector "create-backup"
    actionSelector "start"

    logger "Server restarted"
    logger "[ RESTART ] END"
  }

  if [ "$1" != "$TO_UPDATE" ]
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

    executeOutro

    return
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

  executeOutro
}
