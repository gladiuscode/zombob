#!/bin/bash

trackPlayers() {
  if ! test -f "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  then
    touch "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  fi

  NOW=$( date +"%c" )
  echo "$NOW" >> "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  echo "[Players] $PLAYERS_COUNT" >> "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
}

cleanUpTacker() {
  if test -f "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  then
    rm "$ZOMBOB_DATA_STATISTICS_FILE_PATH"
  fi
}
