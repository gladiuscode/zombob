#!/bin/bash

databasePath=$1
savesPath=$2

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
rm $databasePath

echo "Deleting saves"
rm -rf $savesPath

echo "Server wiped"
