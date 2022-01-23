#!/bin/bash

start() {
  echo "[ ZOMBOB ] > start"

  checkServerStatus "up"
  killServer

  screen -dmS "$SCREEN_SERVER_NAME"
  sendServerCommand "cd $SERVER_PATH"
  sendServerCommand "./start-server.sh -servername $SERVER_NAME"

  resetStartupDate
  setStartupDate

  echo "[ ZOMBOB ] > Server is up and running"
}
