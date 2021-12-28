#!/bin/bash

MODS_CONFIG_PATH=$1
MODS_PATH=$2
SAVES_PATH=$3
DATABASE_PATH=$4
BACKUPS_PATH=$5
SERVER_PATH=$6

# stop server
./stop.sh
sleep 15s

# create backup
./create-backup.sh "$SAVES_PATH" "$DATABASE_PATH" "$BACKUPS_PATH"
sleep 15s

# delete config file
echo "Deleting mods config"
rm "$MODS_CONFIG_PATH"

# delete all mods
echo "Deleting mods"
rm -rf "$MODS_PATH"

# start server
./start.sh "$SERVER_PATH"
sleep 15s
