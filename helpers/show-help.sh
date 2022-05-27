#!/bin/bash

showHelp() {
  echo "#############################################"
  echo "                 DESCRIPTION                 "
  echo "#############################################"
  printf "\n"

  echo "This utility can be used to manage multiple zomboid servers."
  echo "It accepts up to three flag parameters:"
  printf "\n"
  echo "1. -s => It should be the name of your server"
  echo "2. -c => It should be one of the supported commands*"
  echo "3. -i => It should be an optional parameter related to the selected action"
  printf "\n"

  echo "#############################################"
  echo "               POSSIBLE COMMANDS             "
  echo "#############################################"
  printf "\n"

  echo "> status                          - It tells the status of the server."
  printf "\n"
  echo "> start                           - It starts the server."
  printf "\n"
  echo "> stop                            - It stops the server."
  echo "                      -i skipWait - immediately stops the server."
  printf "\n"
  echo "> restart                         - It restarts the server."
  echo "                      -i toUpdate"
  echo "                      -i cleanUp"
  printf "\n"
  echo "> reset                           - It resets the server."
  printf "\n"
  echo "> update                          - It updates the server."
  printf "\n"
  echo "> check-update-mods               - It checks and restarts the server if any mods should be updated."
  printf "\n"
  echo "> force-update-mods               - It enforces a force mods update."
  printf "\n"
  echo "> create-backup                   - It creates a backup."
  printf "\n"
  echo "> clean-backups                   - It cleans all old backups."
  printf "\n"
  echo "> send-message                    - It sends a message."
  echo "                      -i message"
  printf "\n"
  echo "> count-players"
  echo "                      -i track"
  printf "\n"
  echo "> exit"
}
