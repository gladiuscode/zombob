#!/bin/bash

cleanBackups() {
  logger "Server cleanup backups started"

  find "$ZOMBOB_DATA_BACKUPS_PATH" -maxdepth 1 -type d -mtime +"$ZOMBOB_DATA_BACKUPS_CLEANUP_DAYS" -exec rm -rf {} \;

  logger "Server cleanup backups completed"
}
