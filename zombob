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
      echo "Unknown action. Input -h to see all options"
  esac
}

# ====================
# INPUT PARSER
# ====================

if [ "$#" == 0 ]
  then
    showHelp
    exit
fi

while getopts s:a:i:h: flag
do
  case "${flag}" in
    s) SERVER_NAME=${OPTARG};;
    a) TYPE=${OPTARG};;
    i) ARG=${OPTARG};;
    *) showHelp
      ;;
  esac
done

actionSelector


