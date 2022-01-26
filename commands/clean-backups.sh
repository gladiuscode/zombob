#!/bin/bash

cleanBackups() {
  echo "[ ZOMBOB : INFO ] > Server cleanup backups started"

  find "$BACKUPS_PATH" -maxdepth 1 -type d -mtime +"$BACKUPS_CLEANUP_DAYS" -exec rm -rf {} \;

  echo "[ ZOMBOB : INFO ] > Server cleanup backups completed"
}
