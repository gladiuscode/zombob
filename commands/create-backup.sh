#!/bin/bash

createBackup() {
  logger "[ CREATE_BACKUP ] START"

  local RAW_BACKUP_DATE
  RAW_BACKUP_DATE=$( date +"%c" )

  local BACKUP_DATE="${RAW_BACKUP_DATE// /_}"
  local BACKUP_FOLDER="$ZOMBOB_DATA_BACKUPS_PATH/$BACKUP_DATE"
  local BACKUP_FOLDER_NAME="$ZOMBOB_DATA_BACKUPS_PATH/$BACKUP_DATE/backup.tar"

  [ ! -d "$ZOMBOB_DATA_BACKUPS_PATH" ] && mkdir -p "$ZOMBOB_DATA_BACKUPS_PATH"
  [ ! -d "$ZOMBOB_DATA_BACKUPS_PATH" ] && logger "Backups directory in Zomboid folder is missing. Please create it." && exit 1

  logger "Creating backup"
  mkdir "$BACKUP_FOLDER"
  tar -zcf "$BACKUP_FOLDER_NAME" "$SAVES_PATH" "$DATABASE_PATH" "$ZOMBOID_SERVER_FOLDER_PATH"
  logger "Backup created"

  logger "Backup done"
  logger "[ CREATE_BACKUP ] END"
}
