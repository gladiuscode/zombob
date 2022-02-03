#!/bin/bash

reset() {
  logger "[ ZOMBOB : INFO ] > Server reset started"

  checkServerStatus "up"

  logger "Are you sure? y/N"
  read -r confirm

  if [ -z "$confirm" ] || [ "$confirm" == "n" ] || [ "$confirm" == "N" ]
  then
    logger "Reset aborted"
  else
   logger "Deleting database"
   rm "$DATABASE_PATH"

   logger "Deleting saves"
   rm -rf "$SAVES_PATH"

   logger "[ ZOMBOB : INFO ] > Server reset completed"
  fi
}
