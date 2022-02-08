#!/bin/bash

cleanBackups() {
  logger "Server cleanup backups started"

  find "$ZOMBOB_DATA_BACKUPS_PATH" -mtime +1 -exec rm -rf {} \;

  logger "Server cleanup backups completed"
}
