#!/bin/bash

updateMods() {
  logger "Server update mods started"

  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"

  logger "Deleting mods config"
  rm "$MODS_CONFIG_PATH"

  logger "Deleting mods"
  rm -rf "$MODS_PATH"

  actionSelector "start"

  logger "Server mods updated"
}
