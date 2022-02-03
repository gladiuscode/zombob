#!/bin/bash

createBackup() {
  logger "[ ZOMBOB : INFO ] > Server backup started"

  RAW_BACKUP_DATE=$( date +"%c" )
  BACKUP_DATE="${RAW_BACKUP_DATE// /_}"

  BACKUP_FOLDER="$BACKUPS_PATH/$BACKUP_DATE"
  BACKUP_FOLDER_NAME="$BACKUPS_PATH/$BACKUP_DATE/backup.tar"

  [ ! -d "$BACKUPS_PATH" ] && mkdir -p "$BACKUPS_PATH"
  [ ! -d "$BACKUPS_PATH" ] && logger "Backups directory in Zomboid folder is missing. Please create it." && exit

  logger "[ ZOMBOB : INFO ] > Creating backup"
  mkdir "$BACKUP_FOLDER"
  tar -zcf "$BACKUP_FOLDER_NAME" "$SAVES_PATH" "$DATABASE_PATH"
  logger "[ ZOMBOB : INFO ] > Backup created"

  logger "[ ZOMBOB : INFO ] > Server backup completed"
}
