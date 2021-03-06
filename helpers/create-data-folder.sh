#!/bin/bash

createDataFolder() {
  logger "[ CREATE_DATA_FOLDER : HELPER ] START"

  if test -d "$ZOMBOB_DATA_PATH"
  then
    logger "Data folder already initialized"
    return
  fi

  mkdir "$ZOMBOB_DATA_PATH"
  [ ! -d "$ZOMBOB_DATA_PATH" ] && logger -e "Cannot create zombob-data folder" && exit 1

  mkdir "$ZOMBOB_DATA_STATISTICS_FOLDER_PATH"
  [ ! -d "$ZOMBOB_DATA_STATISTICS_FOLDER_PATH" ] && logger -e "Cannot create statistics folder" && exit 1

  logger "[ CREATE_DATA_FOLDER : HELPER ] END"
}
