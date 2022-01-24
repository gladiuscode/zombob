#!/bin/bash

start() {
  echo "[ ZOMBOB : INFO ] > start"

  checkServerStatus "up"
  killServerScreen

  screen -dmS "$SCREEN_SERVER_NAME"
  sendServerCommand "cd $SERVER_PATH"
  sendServerCommand "./start-server.sh -servername $SERVER_NAME"

  resetStartupDate
  setStartupDate

  echo "[ ZOMBOB : INFO ] > Server is up and running"
}
