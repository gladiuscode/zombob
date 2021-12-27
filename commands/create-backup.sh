#!/bin/bash

savesPath=$1
backupsPath=$2

backupDate=$(date +"%m-%d-%y-%H-%M-%S")
backupFolderName="$backupsPath/backup-${backupDate}"

# check if backups dir doesn't exist
[ ! -d "$backupsPath" ] && mkdir "$backupsPath"
[ ! -d "$backupsPath" ] && echo "Backups directory in Zomboid folder is missing. Please create it." && exit

# create backup
echo "Creating backup"
tar -zcf "$backupFolderName" "$savesPath"
echo "Backup created"
