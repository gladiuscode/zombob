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
SERVER_CONSOLE="${ZOMBOID_PATH}/server-console.txt"

# input handler
actionSelector() {
  case "$1" in
    "start")
      start ;;
    "stop")
      stop "$2" ;;
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
    "send-message")
      sendMessage "$2" ;;
    "count-players")
      countPlayers ;;
    "exit")
      echo "Goodbye!"
      exit ;;
    *)
      echo "Please input an action [start|stop|restart|reset|update|create-backup|restore-backup|update-mods|send-message|count-players] or [exit]"
      read -r input
      actionSelector "$input"
  esac
}

# start server
start() {
  echo "[ZOMBOB] > start"
  $COMMANDS_PATH/start.sh $SERVER_PATH
  CAN_KEEP_GOING=$?
  [ $CAN_KEEP_GOING == 0 ] && echo "Something went wrong" && exit
  echo "[ZOMBOB] > Server is up and running"
}

# stop server
stop() {
  echo "[ZOMBOB] > stop"
  $COMMANDS_PATH/stop.sh "$1"
}

# restart server
restart() {
  echo "[ZOMBOB] > restart"
  $COMMANDS_PATH/restart.sh
  CAN_KEEP_GOING=$?
  [ $CAN_KEEP_GOING == 0 ] && echo "Something went wrong" && exit
  actionSelector "stop" "skipWait"
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
  actionSelector "stop" "toUpdate"
  actionSelector "create-backup"
  $COMMANDS_PATH/update-mods.sh $MODS_CONFIG_PATH $MODS_PATH
  actionSelector "start"
}

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

actionSelector "$1"
