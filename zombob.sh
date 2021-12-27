#!/bin/bash
commandsPath="commands"
serverPath=".steam/steamcmd/pzserver"
workshopPath="${serverPath}/steamapps/workshop"
modsConfigPath="${workshopPath}/appworkshop_108600.acf"
modsPath="${workshopPath}/content/108600"
databasePath="Zomboid/db/servertest.db"
savesPath="Zomboid/Saves/Multiplayer/servertest"
backupsPath="Zomboid/Backups"

navigateToCommands() {
  cd "$commandsPath" || (echo "Can't cd into commands. Abort." && exit)
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
  navigateToCommands
  ./stop.sh
}

# restart server
restart() {
  echo "[ZOMBOB] > restart"
  navigateToCommands
  ./restart.sh
}

# reset server
reset() {
  echo "[ZOMBOB] > reset"
  navigateToCommands
  ./reset.sh $databasePath $savesPath
}

# update server
update() {
  echo "[ZOMBOB] > update"
}

# create backup
createBackup() {
  echo "[ZOMBOB] > create backup"
  navigateToCommands
  ./create-backup.sh $savesPath $databasePath $backupsPath
}

# restore backup
restoreBackup() {
  echo "[ZOMBOB] > restore backup"
}

# update mods
updateMods() {
  echo "[ZOMBOB] > update mods"
  navigateToCommands
  ./update-mods.sh $modsConfigPath $modsPath $savesPath $databasePath $backupsPath $serverPath
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

cd

exit
