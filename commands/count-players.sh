#!/bin/bash

countPlayers() {
  logger "[ ZOMBOB : INFO ] > Count Players started"

  checkServerStatus "down"

  sendServerCommand "players"
  sleep 10s

  RAW_PLAYERS=$(grep -o "Players.*" "$SERVER_CONSOLE" | tail -1)
  RAW_MAX_PLAYERS=$(grep -o "MaxPlayers=.*" "$SERVER_INI_PATH")
  PLAYERS=${RAW_PLAYERS//[^0-9]/}
  MAX_PLAYERS=${RAW_MAX_PLAYERS//[^0-9]/}

  MESSAGE="$PLAYERS / $MAX_PLAYERS"

  logger "[ ZOMBOB : INFO ] > $MESSAGE"

  logger "[ ZOMBOB : INFO ] > Count Players stopped"

  logger -s "$MESSAGE"
}
