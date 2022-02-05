#!/bin/bash

update() {
  logger "Server update started"

  checkServerStatus "up"

  $STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

  logger "Server update completed"
}
