#!/bin/bash

DATABASE_PATH=$1
SAVES_PATH=$2

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is running. Can't wipe" && exit

echo "Are you sure? y/N"
read -r confirm

if [ -z "$confirm" ] || [ "$confirm" == "n" ] || [ "$confirm" == "N" ]
then
  echo "Reset aborted"
  exit
fi

echo "Deleting database"
rm "$DATABASE_PATH"

echo "Deleting saves"
rm -rf "$SAVES_PATH"

echo "Server wiped"
