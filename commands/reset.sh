#!/bin/bash

reset() {
  logger "[ RESET ] START"

  checkScriptAvailability

  checkServerStatus "up"

  trackStatus "resetting"

  logger "Are you sure? y/N"
  read -r CONFIRM

  if [ -z "$CONFIRM" ] || [ "$CONFIRM" == "n" ] || [ "$CONFIRM" == "N" ]
  then
    logger "Reset aborted"
    trackStatus "none"
    logger "[ RESET ] END"
    return
  fi

  logger "Deleting database"
  rm "$DATABASE_PATH"

  logger "Deleting saves"
  rm -rf "$SAVES_PATH"

  trackStatus "none"

  logger "Server reset completed"
  logger "[ RESET ] END"
}
