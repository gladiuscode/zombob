#!/bin/bash

loadCrontabBackup() {
  logger "[ LOAD CRONTAB BACKUP ] START"

  crontab "$CRONTAB_BACKUP_PATH"

  logger "Server reset completed"
  logger "[ LOAD CRONTAB BACKUP ] END"
}
