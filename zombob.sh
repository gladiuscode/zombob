#!/bin/bash
HOME=~/

ZOMBOB_PATH="$HOME/zombob"
COMMANDS_PATH="$ZOMBOB_PATH/commands"

SERVER_PATH="$HOME/.steam/steamcmd/pzserver"
WORKSHOP_PATH="${SERVER_PATH}/steamapps/workshop"
MODS_CONFIG_PATH="${WORKSHOP_PATH}/appworkshop_108600.acf"
MODS_PATH="${WORKSHOP_PATH}/content/108600"

ZOMBOID_PATH="$HOME/Zomboid"
databasePath="$ZOMBOID_PATH/db/servertest.db"
savesPath="$ZOMBOB_PATH/Saves/Multiplayer/servertest"
backupsPath="$ZOMBOID_PATH/Backups"

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
    *)
      echo "Please provide a correct action" ;;
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
  echo $CAN_KEEP_GOING
  [ $CAN_KEEP_GOING == 1 ] && echo "Something went wrong" && exit

  actionSelector "stop"
  actionSelector "create-backup"
  actionSelector "start"
}

# reset server
reset() {
  echo "[ZOMBOB] > reset"
  $COMMANDS_PATH/reset.sh $databasePath $savesPath
}

# update server
update() {
  echo "[ZOMBOB] > update"
}

# create backup
createBackup() {
  echo "[ZOMBOB] > create backup"
  $COMMANDS_PATH/create-backup.sh $savesPath $databasePath $backupsPath
}

# restore backup
restoreBackup() {
  echo "[ZOMBOB] > restore backup"
}

# update mods
updateMods() {
  echo "[ZOMBOB] > update mods"
  $COMMANDS_PATH/update-mods.sh $MODS_CONFIG_PATH $MODS_PATH $savesPath $databasePath $backupsPath $SERVER_PATH
}

echo "Please input an action {start|stop|restart|reset|update|create-backup|restore-backup|update-mods}"
read -r input
actionSelector "$input"

exit
