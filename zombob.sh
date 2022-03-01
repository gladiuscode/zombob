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
    "clean-backups")
      cleanBackups ;;
    "check-update-mods")
      checkUpdateMods ;;
    "force-update-mods")
      forceUpdateMods ;;
    "send-message")
      sendMessage "$ARG" ;;
    "count-players")
      countPlayers "$ARG" ;;
    "exit")
      echo "Goodbye!"
      exit 0;;
    *)
      echo "Please input one of the following actions with optional parameters:"
      echo "* status"
      echo "* start"
      echo "* stop skipWait"
      echo "* restart toUpdate cleanUp"
      echo "* reset"
      echo "* update"
      echo "* check-update-mods"
      echo "* force-update-mods"
      echo "* create-backup"
      echo "* clean-backups"
      echo "* send-message message"
      echo "* count-players track"
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
