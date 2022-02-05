#!/bin/bash

setStartupDate() {
  STARTUP_DATE=$( date +"%s" )
  touch "$ZOMBOB_DATA_ENV_FILE_PATH"
  echo "$STARTUP_DATE" > "$ZOMBOB_DATA_ENV_FILE_PATH"
}

resetStartupDate() {
  if test -f "$ZOMBOB_DATA_ENV_FILE_PATH"; then
      rm "$ZOMBOB_DATA_ENV_FILE_PATH"
  fi
}
