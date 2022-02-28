#!/bin/bash

start() {
  logger "[ START ] START"

  checkServerStatus "up"
  killServerScreen

  screen -dmS "$SCREEN_SERVER_NAME"
  sendServerCommand "cd $SERVER_PATH"
  sendServerCommand "./start-server.sh -servername $SERVER_NAME"

  resetStartupDate
  setStartupDate

  trackStatus "online"

  logger "Server is up and running"

  logger "[ START ] END"
}
