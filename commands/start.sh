#!/bin/bash

start() {
  logger "[ START ] START"

  checkScriptAvailability

  logger "[Discord] Controllo stato del server"
  checkServerStatus "up"
  killServerScreen

  trackStatus "starting"

  logger "[Discord] Creazione terminale"
  screen -dmS "$SCREEN_SERVER_NAME"
  sendServerCommand "cd $SERVER_PATH"
  sendServerCommand "./start-server.sh -servername $SERVER_NAME"

  resetStartupDate
  setStartupDate

  trackStatus "none"

  logger "[Discord] Server attivo"

  logger "Server is up and running"

  logger "[ START ] END"
}
