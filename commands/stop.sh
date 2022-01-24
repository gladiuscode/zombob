#!/bin/bash

stop() {
  echo "[ ZOMBOB : INFO ] > Server stop started"

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
    echo "Saving current world"
    sendServerCommand "save"
    sleep 10s
    echo "Current world saved"
  }

  quit() {
    echo "Stopping server"
    sendServerCommand "quit"
    sleep 5s
    echo "Server stopped"
  }

  if [ "$STOP_TYPE" == $SKIP_WAIT ]
  then
    save
    quit
    killServerScreen
  else
    computeServerMessage

    echo "Waiting 5 minutes..."
    sendServerMessage "${MESSAGE}5 minuti"
    sleep 1m

    echo "Waiting 4 minutes..."
    sendServerMessage "${MESSAGE}4 minuti"
    sleep 1m

    echo "Waiting 3 minutes..."
    sendServerMessage "${MESSAGE}3 minuti"
    sleep 1m

    echo "Waiting 2 minutes..."
    sendServerMessage "${MESSAGE}2 minuti"
    sleep 1m

    echo "Waiting 1 minutes..."
    sendServerMessage "${MESSAGE}1 minuto"
    sleep 1m

    echo "Saving..."
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

  echo "[ ZOMBOB : INFO ] > Server stop completed"
}
