#!/bin/bash

MODS_CONFIG_PATH=$1
MODS_PATH=$2

# delete config file
echo "Deleting mods config"
rm "$MODS_CONFIG_PATH"

# delete all mods
echo "Deleting mods"
rm -rf "$MODS_PATH"
