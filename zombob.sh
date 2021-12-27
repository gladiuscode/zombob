#!/bin/bash
commandsPath="commands"
serverPath=".steam/steamcmd/pzserver"
databasePath="Zomboid/db/servertest.db"
savesPath="Zomboid/Saves/Multiplayer/servertest"

navigateToCommands() {
  cd "$commandsPath" || (echo "Can't cd into commands. Abort." && exit)
}

# start server
start() {
  echo "[ZOMBOB] > start"
  navigateToCommands
  chmod +x start.sh
  ./start.sh $serverPath
  chmod -x start.sh
}

# stop server
stop() {
  echo "[ZOMBOB] > stop"
  navigateToCommands
  chmod +x stop.sh
  ./stop.sh
  chmod -x stop.sh
}

# restart server
restart() {
  echo "[ZOMBOB] > restart"
    navigateToCommands
    chmod +x restart.sh
    ./restart.sh
    chmod -x restart.sh
}

# reset server
reset() {
  echo "[ZOMBOB] > reset"
  chmod +x reset.sh
  ./reset.sh $databasePath $savesPath
  chmod -x reset.sh
}

# update server
update() {
  echo "[ZOMBOB] > update"
}

# create backup
createBackup() {
  echo "[ZOMBOB] > create backup"
}

# restore backup
restoreBackup() {
  echo "[ZOMBOB] > restore backup"
}

# update mods
updateMods() {
  echo "[ZOMBOB] > update mods"
}

echo "Please input an action {start|stop|restart|reset|update|create-backup|restore-backup|update-mods}"
read input

case "$input" in

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

exit
