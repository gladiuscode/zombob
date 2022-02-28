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
for HLP_PATH in $ZOMBOB_HELPERS_PATH
do
  source "$HLP_PATH"
done

# ====================
# COMMANDS
# ====================
for CMD_PATH in $ZOMBOB_COMMANDS_PATH
do
  source "$CMD_PATH"
done

# ====================
# MAIN INPUT HANDLER
# ====================
actionSelector() {
  local TYPE=$1
  local ARG=$2

  createDataFolder

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
      logger "Server restore backup started"
      logger "Server backup restored"
      ;;
    "update-mods")
      updateMods ;;
    "send-message")
      sendMessage "$ARG" ;;
    "count-players")
      countPlayers "$ARG" ;;
    "check-mods")
      checkMods ;;
    "clean-backups")
      cleanBackups ;;
    "exit")
      logger "Goodbye!"
      exit 0;;
    *)
      logger "Please input an action [status|start|stop|restart|reset|update|create-backup|restore-backup|update-mods|send-message|count-players|check-mods|clean-backups] or [exit]"
      read -r input
      actionSelector "$input"
  esac
}

echo "****************************************************************"
echo "****                        ZOMBOB                          ****"
echo "****************************************************************"
actionSelector "$1" "$2"

exit 0
