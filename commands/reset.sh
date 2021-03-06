#!/bin/bash

reset() {
  logger "[ RESET ] START"

  checkServerStatus "up"

  trackStatus "resetting"

  logger "Are you sure? y/N"
  read -r CONFIRM

  if [ -z "$CONFIRM" ] || [ "$CONFIRM" == "n" ] || [ "$CONFIRM" == "N" ]
  then
    logger "Reset aborted"
    logger "[ RESET ] END"
    return
  fi

  logger "Deleting database"
  rm "$DATABASE_PATH"

  logger "Deleting saves"
  rm -rf "$SAVES_PATH"

  trackStatus "offline"

  logger "Server reset completed"
  logger "[ RESET ] END"
}
