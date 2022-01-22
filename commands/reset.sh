#!/bin/bash

reset() {
  echo "[ ZOMBOB ] > Server reset started"

  checkServerStatus "up"

  echo "Are you sure? y/N"
  read -r confirm

  if [ -z "$confirm" ] || [ "$confirm" == "n" ] || [ "$confirm" == "N" ]
  then
    echo "Reset aborted"
  else
   echo "Deleting database"
   rm "$DATABASE_PATH"

   echo "Deleting saves"
   rm -rf "$SAVES_PATH"

   echo "[ ZOMBOB ] > Server reset completed"
  fi
}
