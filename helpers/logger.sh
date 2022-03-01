#!/bin/bash

logger() {
  local MESSAGE=$1
  local INFO="[ ZOMBOB : INFO ] > "
  local ERROR="[ ZOMBOB : ERROR ] > "
  local PREFIX
  [ "$1" == "-e" ] && PREFIX=$ERROR || PREFIX=$INFO

  if ! test -f "$ZOMBOB_DATA_PLAYERS_FILE_PATH"
  then
    touch "$ZOMBOB_DATA_CONSOLE_FILE_PATH"
  fi

  echo "$MESSAGE"
  echo "$PREFIX $MESSAGE" >> "$ZOMBOB_DATA_CONSOLE_FILE_PATH"
}
