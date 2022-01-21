#!/bin/bash

# ====================
# CONFIGURATION
# ====================
HOME=~/

# Zombob Configuration
ZOMBOB_PATH="${HOME}zombob"
COMMANDS_PATH="${ZOMBOB_PATH}/commands"
HELPERS_PATH="${ZOMBOB_PATH}/helpers"

STEAMCMD_PATH="${HOME}steamcmd"

# Zombob Configuration
SERVER_PATH="${HOME}.steam/steamcmd/pzserver"
WORKSHOP_PATH="${SERVER_PATH}/steamapps/workshop"
MODS_CONFIG_PATH="${WORKSHOP_PATH}/appworkshop_108600.acf"
MODS_PATH="${WORKSHOP_PATH}/content/108600"

ZOMBOID_PATH="${HOME}Zomboid"
SERVER_INI_PATH="${ZOMBOID_PATH}/Server/servertest.ini"
ENV_FILE_PATH="${ZOMBOID_PATH}/Server/env.txt"
STEAM_API_RESPONSE="${ZOMBOID_PATH}/Server/steam_response.txt"
DATABASE_PATH="${ZOMBOID_PATH}/db/servertest.db"
SAVES_PATH="${ZOMBOID_PATH}/Saves/Multiplayer/servertest"
BACKUPS_PATH="${ZOMBOID_PATH}/Backups"
SERVER_CONSOLE="${ZOMBOID_PATH}/server-console.txt"

# ====================
# HELPERS
# ====================
checkServerStatus() {
  STATUS_TO_CHECK=$1

  $HELPERS_PATH/server-status.sh
  STATUS=$?

  if [ "$STATUS_TO_CHECK" == "up" ] && [ $STATUS -eq 1 ]
  then
    echo "[ ZOMBOB : ERROR ] > Server is up" && exit
  fi

  if [ "$STATUS_TO_CHECK" == "down" ] && [ $STATUS -eq 0 ]
  then
    echo "[ ZOMBOB : ERROR ] > Server is down" && exit
  fi
}

setStartupDate() {
  STARTUP_DATE=$( date +"%s" )
  touch $ENV_FILE_PATH
  echo "$STARTUP_DATE" > "$ENV_FILE_PATH"
}

resetStartupDate() {
  rm "$ENV_FILE_PATH"
}

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
      restoreBackup ;;
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

# ====================
# COMMANDS WRAPPERS
# ====================
start() {
  echo "[ ZOMBOB ] > start"

  checkServerStatus "up"

  $COMMANDS_PATH/start.sh $SERVER_PATH

  resetStartupDate
  setStartupDate
  echo "[ ZOMBOB ] > Server is up and running"
}

stop() {
  echo "[ ZOMBOB ] > Server stop started"

  checkServerStatus "down"

  $COMMANDS_PATH/stop.sh "$1"
  echo "[ ZOMBOB ] > Server stop completed"
}

restart() {
  echo "[ ZOMBOB ] > Server restart started"
  $COMMANDS_PATH/restart.sh "$1"

  checkServerStatus "down"

  actionSelector "stop" "skipWait"
  actionSelector "create-backup"
  actionSelector "start"
  echo "[ ZOMBOB ] > Server restart completed"
}

reset() {
  echo "[ ZOMBOB ] > Server reset started"

  checkServerStatus "up"

  $COMMANDS_PATH/reset.sh $DATABASE_PATH $SAVES_PATH
  echo "[ ZOMBOB ] > Server reset completed"
}

update() {
  echo "[ ZOMBOB ] > Server update started"

  checkServerStatus "up"

  $COMMANDS_PATH/update.sh $STEAMCMD_PATH
  echo "[ ZOMBOB ] > Server update completed"
}

createBackup() {
  echo "[ ZOMBOB ] > Server backup started"
  $COMMANDS_PATH/create-backup.sh $SAVES_PATH $DATABASE_PATH $BACKUPS_PATH
  echo "[ ZOMBOB ] > Server backup completed"
}

restoreBackup() {
  echo "[ ZOMBOB ] > Server restore backup started"
  echo "[ ZOMBOB ] > Server backup restored"
}

updateMods() {
  echo "[ ZOMBOB ] > Server update mods started"
  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"
  $COMMANDS_PATH/update-mods.sh $MODS_CONFIG_PATH $MODS_PATH
  actionSelector "start"
  echo "[ ZOMBOB ] > Server mods updated"
}

sendMessage() {
  echo "[ZOMBOB] > Send Message started"
  checkServerStatus "down"
  $COMMANDS_PATH/send-message.sh "$1"
  echo "[ZOMBOB] > Send Message completed"
}

countPlayers() {
  echo "[ ZOMBOB ] > Count Players started"
  $COMMANDS_PATH/count-players.sh $SERVER_CONSOLE
  echo "[ ZOMBOB ] > Count Players stopped"
}

checkMods() {
  echo "[ ZOMBOB ] > Check mods update started"

  checkServerStatus "down"

  $COMMANDS_PATH/check-mods.sh $SERVER_INI_PATH $ENV_FILE_PATH $STEAM_API_RESPONSE
  SHOULD_UPDATE_MODS=$?
  [ $SHOULD_UPDATE_MODS -eq 0 ] && echo "Mods are up to date" && exit

  actionSelector "restart" "toUpdate"
  echo "[ ZOMBOB ] > Check mods update stopped"
}

echo "****************************************************************"
echo "****                        ZOMBOB                          ****"
echo "****************************************************************"

actionSelector "$1" "$2"
