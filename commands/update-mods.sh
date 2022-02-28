#!/bin/bash

forceUpdateMods() {
  logger "[ FORCE_UPDATE_MODS ] START"

  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"

  logger "Deleting mods config"
  rm "$MODS_CONFIG_PATH"

  logger "Deleting mods"
  rm -rf "$MODS_PATH"

  actionSelector "start"

  logger "Force mods update completed"
  logger "[ FORCE_UPDATE_MODS ] END"
}
