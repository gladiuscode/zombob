#!/bin/bash

start() {
  echo "[ ZOMBOB ] > start"

  checkServerStatus "up"

  screen -dmS server
  sendServerCommand "cd $SERVER_PATH"
  sendServerCommand "./start-server.sh"

  resetStartupDate
  setStartupDate

  echo "[ ZOMBOB ] > Server is up and running"
}
