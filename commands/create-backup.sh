#!/bin/bash

createBackup() {
  echo "[ ZOMBOB : INFO ] > Server backup started"

  BACKUP_DATE=$(date +"%m-%d-%y-%H-%M-%S")
  BACKUP_FOLDER="$BACKUPS_PATH/$BACKUP_DATE"
  BACKUP_FOLDER_NAME="$BACKUPS_PATH/$BACKUP_DATE/backup.tar"

  # check if backups dir doesn't exist
  [ ! -d "$BACKUPS_PATH" ] && mkdir -p "$BACKUPS_PATH"
  [ ! -d "$BACKUPS_PATH" ] && echo "Backups directory in Zomboid folder is missing. Please create it." && exit

  # create backups
  echo "Creating backup"
  mkdir "$BACKUP_FOLDER"
  tar -zcf "$BACKUP_FOLDER_NAME" "$SAVES_PATH" "$DATABASE_PATH"
  echo "Backup created"

  echo "[ ZOMBOB : INFO ] > Server backup completed"
}
