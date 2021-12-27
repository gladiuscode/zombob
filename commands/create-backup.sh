#!/bin/bash

savesPath=$1
databasePath=$2
backupsPath=$3

backupDate=$(date +"%m-%d-%y-%H-%M-%S")
backupFolder="$backupsPath/$backupDate"
backupFolderName="$backupsPath/$backupDate/backup.tar"

# check if backups dir doesn't exist
[ ! -d "$backupsPath" ] && mkdir "$backupsPath"
[ ! -d "$backupsPath" ] && echo "Backups directory in Zomboid folder is missing. Please create it." && exit

# create backups
echo "Creating backup"
mkdir "$backupFolder"
tar -zcf "$backupFolderName" "$savesPath" "$databasePath"
echo "Backup created"
