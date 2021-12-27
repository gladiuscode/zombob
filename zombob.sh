#!/bin/bash
commandsPath="commands"
serverPath=".steam/steamcmd/pzserver"

navigateToCommands() {
  cd "$commandsPath" || echo "Can't cd into commands. Abort." && exit
  pwd
}

# start server
start() {
  echo "[ZOMBOB] > start"
  navigateToCommands
  ./start.sh $serverPath
}

# stop server
stop() {
  echo "[ZOMBOB] > stop"
}

# restart server
restart() {
  echo "[ZOMBOB] > restart"
}

# reset server
reset() {
  echo "[ZOMBOB] > reset"
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

case $input in

  start)
    start ;;

  stop)
    stop ;;

  restart)
    restart ;;

  reset)
    reset ;;

  update)
    update ;;

  create-backup)
    createBackup ;;

  restore-backup)
    restoreBackup ;;

  update-mods)
    updateMods ;;

  *)
    echo "Please provide a correct action" ;;

esac

exit
