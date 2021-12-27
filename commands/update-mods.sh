#!/bin/bash

configFilePath=$1
modsFolderPath=$2
savesPath=$3
databasePath=$4
backupsPath=$5
serverPath=$6

cd

# stop server
./stop.sh
sleep 15s

# create backup
./create-backup.sh "$savesPath" "$databasePath" "$backupsPath"
sleep 15s

# delete config file
echo "Deleting mods config"
rm "$configFilePath"

# delete all mods
echo "Deleting mods"
rm -rf "$modsFolderPath"

# start server
./start.sh "$serverPath"
sleep 15s
