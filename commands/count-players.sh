#!/bin/bash

countPlayers() {
  logger "Count Players started"

  checkServerStatus "down"

  sendServerCommand "players"
  sleep 10s

  RAW_PLAYERS=$(grep -o "Players.*" "$SERVER_CONSOLE" | tail -1)
  RAW_MAX_PLAYERS=$(grep -o "MaxPlayers=.*" "$SERVER_INI_PATH")
  PLAYERS=${RAW_PLAYERS//[^0-9]/}
  MAX_PLAYERS=${RAW_MAX_PLAYERS//[^0-9]/}

  MESSAGE="$PLAYERS / $MAX_PLAYERS"

  logger "$MESSAGE"
  logger -s "$MESSAGE"

  logger "Count Players stopped"
}
