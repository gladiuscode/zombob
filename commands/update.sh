#!/bin/bash

update() {
  logger "[ UPDATE ] START"

  checkServerStatus "up"

  trackStatus "updating"

  $STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

  trackStatus "updated"

  logger "Server updated"
  logger "[ UPDATE ] END"
}
