#!/bin/bash

ZOMBOB_DATA_PATH="${HOME}zombob-data"

createDataFolder() {
  logger "Create data folder started"

  if test -d "$ZOMBOB_DATA_PATH"
  then
    logger "Data folder already initialized"
    return
  fi

  mkdir "$ZOMBOB_DATA_PATH"
  [ ! -d "$ZOMBOB_DATA_PATH" ] && logger "Cannot create zombob-data folder"

  logger "Create data folder completed"
}

createDataFolder
