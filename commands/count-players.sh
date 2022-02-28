#!/bin/bash

countPlayers() {
  logger "[ COUNT_PLAYERS ] START"

  checkServerStatus "down"

  sendServerCommand "players"
  sleep 10s

  local RAW_PLAYERS
  RAW_PLAYERS=$(grep -o "Players.*" "$SERVER_CONSOLE" | tail -1)

  local RAW_MAX_PLAYERS
  RAW_MAX_PLAYERS=$(grep -o "MaxPlayers=.*" "$SERVER_INI_PATH")

  local PLAYERS=${RAW_PLAYERS//[^0-9]/}
  local MAX_PLAYERS=${RAW_MAX_PLAYERS//[^0-9]/}

  local PLAYERS_COUNT="$PLAYERS / $MAX_PLAYERS"

  logger "$PLAYERS_COUNT"

  if [ "$1" == "track" ]
  then
    trackPlayers
  fi

  logger "[ COUNT_PLAYERS ] END"
}
