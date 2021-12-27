#!/bin/bash

# start server
start() {
  echo "[ZOMBOB] > start"
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
    start
    ;;

  stop)
    stop
    ;;

  restart)
    restart
    ;;

  reset)
    reset
    ;;

  update)
    update
    ;;

  create-backup)
    createBackup
    ;;

  restore-backup)
    restoreBackup
    ;;

  mods)
    updateMods
    ;;

  *)
    echo "Please provide a correct action"
    ;;

exit