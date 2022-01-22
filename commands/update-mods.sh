#!/bin/bash

updateMods() {
  echo "[ ZOMBOB ] > Server update mods started"

  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"

  echo "Deleting mods config"
  rm "$MODS_CONFIG_PATH"

  echo "Deleting mods"
  rm -rf "$MODS_PATH"

  actionSelector "start"

  echo "[ ZOMBOB ] > Server mods updated"
}
