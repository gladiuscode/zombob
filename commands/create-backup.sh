#!/bin/bash

SAVES_PATH=$1
DATABASE_PATH=$2
BACKUPS_PATH=$3

BACKUP_DATE=$(date +"%m-%d-%y-%H-%M-%S")
BACKUP_FOLDER="$BACKUPS_PATH/$BACKUP_DATE"
BACKUP_FOLDER_NAME="$BACKUPS_PATH/$BACKUP_DATE/backup.tar"

# check if backups dir doesn't exist
[ ! -d "$BACKUPS_PATH" ] && mkdir "$BACKUPS_PATH"
[ ! -d "$BACKUPS_PATH" ] && echo "Backups directory in Zomboid folder is missing. Please create it." && exit

# create backups
echo "Creating backup"
mkdir "$BACKUP_FOLDER"
tar -zcf "$BACKUP_FOLDER_NAME" "$SAVES_PATH" "$DATABASE_PATH"
echo "Backup created"
