#!/bin/bash

updateMods() {
  logger "[ ZOMBOB : INFO ] > Server update mods started"

  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"

  logger "Deleting mods config"
  rm "$MODS_CONFIG_PATH"

  logger "Deleting mods"
  rm -rf "$MODS_PATH"

  actionSelector "start"

  logger "[ ZOMBOB : INFO ] > Server mods updated"
}
