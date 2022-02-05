#!/bin/bash

createDataFolder() {
  logger "Create data folder started"

  if test -d "$ZOMBOB_DATA_PATH"
  then
    logger "Data folder already initialized"
    return
  fi

  mkdir "$ZOMBOB_DATA_PATH"
  [ ! -d "$ZOMBOB_DATA_PATH" ] && logger -e "Cannot create zombob-data folder" && exit 0

  logger "Create data folder completed"
}
