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
    "force-mods-mods")
      forceUpdateMods ;;
    "send-message")
      sendMessage "$ARG" ;;
    "count-players")
      countPlayers "$ARG" ;;
    "check-mods")
      checkMods ;;
    "clean-backups")
      cleanBackups ;;
    "exit")
      echo "Goodbye!"
      exit 0;;
    *)
      echo "Please input one of the following actions:"
      echo "* status"
      echo "* start"
      echo "* stop"
      echo "* restart"
      echo "* reset"
      echo "* update"
      echo "* create-backup"
      echo "* restore-backup"
      echo "* force-mods-mods"
      echo "* send-message"
      echo "* count-players"
      echo "* check-mods"
      echo "* clean-backups"
      echo "* exit"

      read -r input
      actionSelector "$input"
  esac
}

echo "****************************************************************"
echo "****                        ZOMBOB                          ****"
echo "****************************************************************"

actionSelector "$1" "$2"

exit 0
