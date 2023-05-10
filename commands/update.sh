#!/bin/bash

update() {
  logger "[ UPDATE ] START"

  checkScriptAvailability

  checkServerStatus "up"

  trackStatus "updating"

  $STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

  trackStatus "none"

  logger "Server updated"
  logger "[ UPDATE ] END"
}
