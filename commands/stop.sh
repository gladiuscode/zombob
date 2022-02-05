#!/bin/bash

stop() {
  logger "Server stop started"

  checkServerStatus "down"

  TO_UPDATE="toUpdate"
  SKIP_WAIT="skipWait"
  STOP_TYPE=$1

  computeServerMessage() {
    if [ "$STOP_TYPE" == $TO_UPDATE ]
    then
      MESSAGE="Il server si riavvierà per aggiornamento mods tra "
      return
    fi
    MESSAGE="Il server si spegnerà tra "
  }

  save() {
    logger "Saving current world"
    sendServerCommand "save"
    sleep 10s
    logger "Current world saved"
  }

  quit() {
    logger "Stopping server"
    sendServerCommand "quit"
    sleep 5s
    logger "Server stopped"
  }

  if [ "$STOP_TYPE" == $SKIP_WAIT ]
  then
    save
    quit
    killServerScreen
  else
    computeServerMessage

    logger "Waiting 5 minutes..."
    sendServerMessage "${MESSAGE}5 minuti"
    sleep 1m

    logger "Waiting 4 minutes..."
    sendServerMessage "${MESSAGE}4 minuti"
    sleep 1m

    logger "Waiting 3 minutes..."
    sendServerMessage "${MESSAGE}3 minuti"
    sleep 1m

    logger "Waiting 2 minutes..."
    sendServerMessage "${MESSAGE}2 minuti"
    sleep 1m

    logger "Waiting 1 minutes..."
    sendServerMessage "${MESSAGE}1 minuto"
    sleep 1m

    logger "Saving..."
    sendServerMessage "Per favore disconnettiti per un paio di minuti"
    save
    sleep 1m

    sendServerMessage "${MESSAGE}5 secondi"
    sleep 1s
    sendServerMessage "${MESSAGE}4 secondi"
    sleep 1s
    sendServerMessage "${MESSAGE}3 secondi"
    sleep 1s
    sendServerMessage "${MESSAGE}2 secondi"
    sleep 1s
    sendServerMessage "${MESSAGE}1 secondo"
    sleep 1s

    quit
    killServerScreen
  fi

  logger "Server stop completed"
}
