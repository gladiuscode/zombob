#!/bin/bash

trackPlayers() {
  NOW=$( date +"%c" )
  echo "$NOW" >> "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  echo "[Players] $PLAYERS_COUNT" >> "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
}

cleanUpPlayersStatistics() {
  if test -f "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  then
    rm "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  fi
}

trackStatus() {
  cleanUpStatusStatistics
  STATUS=$1
  echo "[Status] $STATUS" >> "$ZOMBOB_DATA_STATUS_FILE_PATH"
}

cleanUpStatusStatistics() {
  if test -f "$ZOMBOB_DATA_STATUS_FILE_PATH"
  then
    rm "$ZOMBOB_DATA_STATUS_FILE_PATH"
  fi
}
