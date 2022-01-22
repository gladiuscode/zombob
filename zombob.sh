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
actionSelector() {
  case "$1" in
    "start")
      start ;;
    "stop")
      stop "$2" ;;
    "restart")
      restart "$2" ;;
    "reset")
      reset ;;
    "update")
      update ;;
    "create-backup")
      createBackup ;;
    "restore-backup")
      echo "[ ZOMBOB ] > Server restore backup started"
      echo "[ ZOMBOB ] > Server backup restored"
      ;;
    "update-mods")
      updateMods ;;
    "send-message")
      sendMessage "$2" ;;
    "count-players")
      countPlayers ;;
    "check-mods")
      checkMods ;;
    "exit")
      echo "[ ZOMBOB ] > Goodbye!"
      exit ;;
    *)
      echo "Please input an action [start|stop|restart|reset|update|create-backup|restore-backup|update-mods|send-message|count-players|check-mods] or [exit]"
      read -r input
      actionSelector "$input"
  esac
}

echo "****************************************************************"
echo "****                        ZOMBOB                          ****"
echo "****************************************************************"

actionSelector "$1" "$2"
