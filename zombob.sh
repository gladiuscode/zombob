#!/bin/bash
HOME=~/

ZOMBOB_PATH="${HOME}/zombob"
COMMANDS_PATH="${ZOMBOB_PATH}/commands"

STEAMCMD_PATH="${HOME}/steamcmd"

SERVER_PATH="${HOME}/.steam/steamcmd/pzserver"
WORKSHOP_PATH="${SERVER_PATH}/steamapps/workshop"
MODS_CONFIG_PATH="${WORKSHOP_PATH}/appworkshop_108600.acf"
MODS_PATH="${WORKSHOP_PATH}/content/108600"

ZOMBOID_PATH="${HOME}/Zomboid"
DATABASE_PATH="${ZOMBOID_PATH}/db/servertest.db"
SAVES_PATH="${ZOMBOID_PATH}/Saves/Multiplayer/servertest"
BACKUPS_PATH="${ZOMBOID_PATH}/Backups"

# input handler
actionSelector() {
  case "$1" in
    "start")
      start ;;
    "stop")
      stop ;;
    "restart")
      restart ;;
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
    "exit")
      echo "Goodbye!"
      exit ;;
    *)
      echo "Please input an action [start|stop|restart|reset|update|create-backup|restore-backup|update-mods] or [exit]"
      read -r input
      actionSelector "$input"
  esac
}

# start server
start() {
  echo "[ZOMBOB] > start"
  $COMMANDS_PATH/start.sh $SERVER_PATH
}

# stop server
stop() {
  echo "[ZOMBOB] > stop"
  $COMMANDS_PATH/stop.sh
}

# restart server
restart() {
  echo "[ZOMBOB] > restart"
  $COMMANDS_PATH/restart.sh
  CAN_KEEP_GOING=$?
  [ $CAN_KEEP_GOING == 1 ] && echo "Something went wrong" && exit
  actionSelector "stop"
  actionSelector "create-backup"
  actionSelector "start"
}

# reset server
reset() {
  echo "[ZOMBOB] > reset"
  $COMMANDS_PATH/reset.sh $DATABASE_PATH $SAVES_PATH
}

# update server
update() {
  echo "[ZOMBOB] > update"
  $COMMANDS_PATH/update.sh $STEAMCMD_PATH
}

# create backup
createBackup() {
  echo "[ZOMBOB] > create backup"
  $COMMANDS_PATH/create-backup.sh $SAVES_PATH $DATABASE_PATH $BACKUPS_PATH
}

# restore backup
restoreBackup() {
  echo "[ZOMBOB] > restore backup"
}

# update mods
updateMods() {
  echo "[ZOMBOB] > update mods"
  actionSelector "stop"
  actionSelector "create-backup"
  $COMMANDS_PATH/update-mods.sh $MODS_CONFIG_PATH $MODS_PATH
  actionSelector "start"
}

actionSelector "$1"
