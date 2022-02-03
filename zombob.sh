#!/bin/bash

# ====================
# CONFIGURATION
# ====================
# shellcheck source=home/steam/zombob/config.cfg
CONFIGURATION_PATH="$HOME/zombob/config.cfg"
source "$CONFIGURATION_PATH"

# ====================
# HELPERS
# ====================
for HLP_PATH in $HELPERS_PATH
do
  source "$HLP_PATH"
done

# ====================
# COMMANDS
# ====================
for CMD_PATH in $COMMANDS_PATH
do
  source "$CMD_PATH"
done

# ====================
# MAIN INPUT HANDLER
# ====================

parseArgs() {
  if [ "$1" != "-b" ]
  then
    AGENT="USER"
    TYPE=$1
    ARG=$2
    return
  fi
  AGENT="BOT"
  TYPE=$2
  ARG=$3
}

actionSelector() {
  parseArgs "$@"
case "$TYPE" in
    "status")
      status ;;
    "start")
      start ;;
    "stop")
      stop "$ARG" ;;
    "restart")
      restart "$ARG" ;;
    "reset")
      reset ;;
    "update")
      update ;;
    "create-backup")
      createBackup ;;
    "restore-backup")
      logger "[ ZOMBOB : INFO ] > Server restore backup started"
      logger "[ ZOMBOB : INFO ] > Server backup restored"
      ;;
    "update-mods")
      updateMods ;;
    "send-message")
      sendMessage "$ARG" ;;
    "count-players")
      countPlayers ;;
    "check-mods")
      checkMods ;;
    "clean-backups")
      cleanBackups ;;
    "exit")
      logger "[ ZOMBOB : INFO ] > Goodbye!"
      exit ;;
    *)
      logger "Please input an action [status|start|stop|restart|reset|update|create-backup|restore-backup|update-mods|send-message|count-players|check-mods|clean-backups] or [exit]"
      read -r input
      actionSelector "$input"
  esac
}

logger "****************************************************************"
logger "****                        ZOMBOB                          ****"
logger "****************************************************************"

actionSelector "$1" "$2" "$3"
