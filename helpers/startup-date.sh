#!/bin/bash

setStartupDate() {
  STARTUP_DATE=$( date +"%s" )
  touch "$ENV_FILE_PATH"
  echo "$STARTUP_DATE" > "$ENV_FILE_PATH"
}

resetStartupDate() {
  if test -f "$ENV_FILE_PATH"; then
      rm "$ENV_FILE_PATH"
  fi
}
