#!/bin/bash

createBackup() {
  logger "Server backup started"

  RAW_BACKUP_DATE=$( date +"%c" )
  BACKUP_DATE="${RAW_BACKUP_DATE// /_}"

  BACKUP_FOLDER="$ZOMBOB_DATA_BACKUPS_PATH/$BACKUP_DATE"
  BACKUP_FOLDER_NAME="$ZOMBOB_DATA_BACKUPS_PATH/$BACKUP_DATE/backup.tar"

  [ ! -d "$ZOMBOB_DATA_BACKUPS_PATH" ] && mkdir -p "$ZOMBOB_DATA_BACKUPS_PATH"
  [ ! -d "$ZOMBOB_DATA_BACKUPS_PATH" ] && logger "Backups directory in Zomboid folder is missing. Please create it." && exit 0

  logger "Creating backup"
  mkdir "$BACKUP_FOLDER"
  tar -zcf "$BACKUP_FOLDER_NAME" "$SAVES_PATH" "$DATABASE_PATH"
  logger "Backup created"

  logger "Server backup completed"
}
