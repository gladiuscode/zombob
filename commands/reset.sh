#!/bin/bash

serverProcess=$(pgrep -f start-server)
[ -n "$serverProcess" ] && echo "Server is running. Can't wipe" && exit 0

DATABASE_PATH=$1
SAVES_PATH=$2

echo "Are you sure? y/N"
read -r confirm

if [ -z "$confirm" ] || [ "$confirm" == "n" ] || [ "$confirm" == "N" ]
then
  echo "Reset aborted"
  exit 0
fi

echo "Deleting database"
rm "$DATABASE_PATH"

echo "Deleting saves"
rm -rf "$SAVES_PATH"

exit 1
