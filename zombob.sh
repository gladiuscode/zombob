#!/bin/bash
HOME=~/

ZOMBOB_PATH="${HOME}zombob"
COMMANDS_PATH="${ZOMBOB_PATH}/commands"

STEAMCMD_PATH="${HOME}steamcmd"

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

setStartupDate() {
  STARTUP_DATE=$( date +"%s" )
  touch $ENV_FILE_PATH
  echo "$STARTUP_DATE" > "$ENV_FILE_PATH"
}

resetStartupDate() {
  rm "$ENV_FILE_PATH"
}

# input handler
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
      echo "****************************************************************"
      echo "****                        ZOMBOB                          ****"
      echo "****************************************************************"
      echo "Please input an action [start|stop|restart|reset|update|create-backup|restore-backup|update-mods|send-message|count-players|check-mods] or [exit]"
      read -r input
      actionSelector "$input"
  esac
}

# start server
start() {
  echo "[ ZOMBOB ] > start"
  $COMMANDS_PATH/start.sh $SERVER_PATH
  CAN_KEEP_GOING=$?
  [ $CAN_KEEP_GOING == 0 ] && echo "Something went wrong" && exit
  resetStartupDate
  setStartupDate
  echo "[ ZOMBOB ] > Server is up and running"
}

# stop server
stop() {
  echo "[ ZOMBOB ] > Server stop started"
  $COMMANDS_PATH/stop.sh "$1"
  echo "[ ZOMBOB ] > Server stop completed"
}

# restart server
restart() {
  echo "[ ZOMBOB ] > Server restart started"
  $COMMANDS_PATH/restart.sh "$1"
  CAN_KEEP_GOING=$?
  [ $CAN_KEEP_GOING == 0 ] && echo "Something went wrong" && exit
  actionSelector "stop" "skipWait"
  actionSelector "create-backup"
  actionSelector "start"
  echo "[ ZOMBOB ] > Server restart completed"
}

# reset server
reset() {
  echo "[ ZOMBOB ] > Server reset started"
  $COMMANDS_PATH/reset.sh $DATABASE_PATH $SAVES_PATH
  echo "[ ZOMBOB ] > Server reset completed"
}

# update server
update() {
  echo "[ ZOMBOB ] > Server update started"
  $COMMANDS_PATH/update.sh $STEAMCMD_PATH
  echo "[ ZOMBOB ] > Server update completed"
}

# create backup
createBackup() {
  echo "[ ZOMBOB ] > Server backup started"
  $COMMANDS_PATH/create-backup.sh $SAVES_PATH $DATABASE_PATH $BACKUPS_PATH
  echo "[ ZOMBOB ] > Server backup completed"
}

# restore backup
restoreBackup() {
  echo "[ ZOMBOB ] > Server restore backup started"
  echo "[ ZOMBOB ] > Server backup restored"
}

# update mods
updateMods() {
  echo "[ ZOMBOB ] > Server update mods started"
  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"
  $COMMANDS_PATH/update-mods.sh $MODS_CONFIG_PATH $MODS_PATH
  actionSelector "start"
  echo "[ ZOMBOB ] > Server mods updated"
}

# send message
sendMessage() {
  echo "[ZOMBOB] > Send Message started"
  $COMMANDS_PATH/send-message.sh "$1"
  echo "[ZOMBOB] > Send Message completed"
}

# count players
countPlayers() {
  echo "[ ZOMBOB ] > Count Players started"
  $COMMANDS_PATH/count-players.sh $SERVER_CONSOLE
  echo "[ ZOMBOB ] > Count Players stopped"
}

# check mods update
checkMods() {
  echo "[ ZOMBOB ] > Check mods update started"
  $COMMANDS_PATH/check-mods.sh $SERVER_INI_PATH $ENV_FILE_PATH $STEAM_API_RESPONSE
  CAN_KEEP_GOING=$?
  [ $CAN_KEEP_GOING == 0 ] && echo "Mods are up to date" && exit
  actionSelector "restart" "toUpdate"
  echo "[ ZOMBOB ] > Check mods update stopped"
}

actionSelector "$1" "$2"
