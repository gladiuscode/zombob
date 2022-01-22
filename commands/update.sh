#!/bin/bash

update() {
  echo "[ ZOMBOB ] > Server update started"

  checkServerStatus "up"

  $STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

  echo "[ ZOMBOB ] > Server update completed"
}
