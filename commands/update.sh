#!/bin/bash

update() {
  logger "[ UPDATE ] START"

  checkServerStatus "up"

  $STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

  logger "Server updated"
  logger "[ UPDATE ] END"
}
