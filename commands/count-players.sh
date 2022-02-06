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

  PLAYERS_COUNT="$PLAYERS / $MAX_PLAYERS"

  logger "$PLAYERS_COUNT"
  logger -s "$PLAYERS_COUNT"

  if [ "$1" != "track" ]
  then
    logger "Count Players stopped"
    return
  fi

  if ! test -f "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  then
    touch "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  fi

  NOW=$( date +"%c" )
  echo "$NOW" >> "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  echo "[Players] $PLAYERS_COUNT" >> "$ZOMBOB_DATA_STATISTICS_FILE_PATH"

  logger "Count Players stopped"
}
