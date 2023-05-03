#!/bin/bash

start() {
  logger "[ START ] START"

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

  trackStatus "online"

  logger "[Discord] Server attivo"

  logger "Server is up and running"

  logger "[ START ] END"
}
