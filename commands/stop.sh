#!/bin/bash

stop() {
  logger "[ STOP ] START"

  logger "[Discord] Controllo stato del server"
  checkServerStatus "down"

  trackStatus "stopping"

  local TO_UPDATE="toUpdate"
  local SKIP_WAIT="skipWait"
  local STOP_TYPE=$1

  computeServerMessage() {
    if [ "$STOP_TYPE" == $TO_UPDATE ]
    then
      MESSAGE="Il server si riavvierà per aggiornamento mods tra "
      return
    fi
    MESSAGE="Il server si spegnerà tra "
  }

  sendWarningMessage() {
    local TIME=$1

    local TIME_UNIT_LOG
    local TIME_UNIT_MESSAGE
    if [ -n "$2" ]
    then
      TIME_UNIT_LOG="seconds"
      TIME_UNIT_MESSAGE="secondi"
    else
      TIME_UNIT_LOG="minutes"
      TIME_UNIT_MESSAGE="minuti"
    fi

    logger "Waiting ${TIME} ${TIME_UNIT_LOG}..."
    logger "[Discord] ${MESSAGE}${TIME} ${TIME_UNIT_MESSAGE}"
    sendServerMessage "${MESSAGE}${TIME} ${TIME_UNIT_MESSAGE}"

    if [ -n "$2" ]
    then
      sleep 1s
      return
    fi
    sleep 1m
  }

  save() {
    logger "Saving current world"
    logger "[Discord] Salvataggio partita avviato"
    sendServerCommand "save"
    sleep 10s
    logger "Current world saved"
    logger "[Discord] Salvataggio partita concluso"
  }

  quit() {
    logger "Stopping server"
    logger "[Discord] Spegnimento server avviato"
    sendServerCommand "quit"
    sleep 5s
    logger "Server stopped"
    logger "[Discord] Spegnimento server concluso"
  }

  if [ "$STOP_TYPE" == $SKIP_WAIT ]
  then
    logger "[Discord] Spegnimento server senza avviso"

    save
    quit
    killServerScreen

    logger "[Discord] Il server è spento"

    logger "Server is down"
    logger "[ STOP ] END"

    return
  fi

  computeServerMessage

  sendWarningMessage "5"
  sendWarningMessage "4"
  sendWarningMessage "3"
  sendWarningMessage "2"
  sendWarningMessage "1"

  sendServerMessage "Per favore disconnettiti per un paio di minuti"
  save
  sleep 1m

  sendWarningMessage "5" "seconds"
  sendWarningMessage "4" "seconds"
  sendWarningMessage "3" "seconds"
  sendWarningMessage "2" "seconds"
  sendWarningMessage "1" "seconds"

  quit
  killServerScreen

  trackStatus "offline"

  logger "[Discord] Server spento"

  logger "Server is down"

  logger "[ STOP ] END"
}
