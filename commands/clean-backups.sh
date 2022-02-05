#!/bin/bash

cleanBackups() {
  logger "Server cleanup backups started"

  find "$BACKUPS_PATH" -maxdepth 1 -type d -mtime +"$BACKUPS_CLEANUP_DAYS" -exec rm -rf {} \;

  logger "Server cleanup backups completed"
}
