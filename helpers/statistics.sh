#!/bin/bash

trackPlayers() {
  logger "[ TRACK_PLAYERS : HELPER ] START"

  local NOW
  NOW=$( date +"%c" )

  echo "$NOW" >> "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  echo "[Players] $PLAYERS_COUNT" >> "$ZOMBOB_DATA_PLAYERS_FILE_PATH"

  logger "[ TRACK_PLAYERS : HELPER ] END"
}

cleanUpPlayersStatistics() {
  logger "[ CLEAN_UP_PLAYERS_STATS : HELPER ] START"

  if test -f "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  then
    rm "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  fi

  logger "[ CLEAN_UP_PLAYERS_STATS : HELPER ] END"
}

trackStatus() {
  logger "[ TRACK_STATUS : HELPER ] START"

  cleanUpStatusStatistics

  local STATUS=$1
  echo "[Status] $STATUS" >> "$ZOMBOB_DATA_STATUS_FILE_PATH"

  logger "[ TRACK_STATUS : HELPER ] END"
}

cleanUpStatusStatistics() {
  logger "[ CLEAN_UP_STATUS_STATS : HELPER ] START"

  if test -f "$ZOMBOB_DATA_STATUS_FILE_PATH"
  then
    rm "$ZOMBOB_DATA_STATUS_FILE_PATH"
  fi

  logger "[ CLEAN_UP_STATUS_STATS : HELPER ] END"
}
