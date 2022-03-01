#!/bin/bash

cleanBackups() {
  logger "[ CLEAN_BACKUPS ] START"

  find "$ZOMBOB_DATA_BACKUPS_PATH" -type d -mtime +1 -exec rm -rf {} \;

  logger "Backups clean completed"
  logger "[ CLEAN_BACKUPS ] END"
}
