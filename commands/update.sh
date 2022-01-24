#!/bin/bash

update() {
  echo "[ ZOMBOB : INFO ] > Server update started"

  checkServerStatus "up"

  $STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

  echo "[ ZOMBOB : INFO ] > Server update completed"
}
