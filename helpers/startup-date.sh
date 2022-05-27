#!/bin/bash

setStartupDate() {
  logger "[ SET_STARTUP_DATE : HELPER ] START"
  STARTUP_DATE=$( date +"%s" )
  touch "$ZOMBOB_DATA_ENV_FILE_PATH"
  echo "$SERVER_NAME - $STARTUP_DATE" > "$ZOMBOB_DATA_ENV_FILE_PATH"
  logger "[ SET_STARTUP_DATE : HELPER ] END"
}

resetStartupDate() {
  logger "[ RESET_STARTUP_DATE : HELPER ] START"
  if test -f "$ZOMBOB_DATA_ENV_FILE_PATH"; then
      logger "Server env file deleted"
      rm "$ZOMBOB_DATA_ENV_FILE_PATH"
  fi
  logger "[ RESET_STARTUP_DATE : HELPER ] END"
}
