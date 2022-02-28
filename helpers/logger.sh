#!/bin/bash

logger() {
  local INFO="[ ZOMBOB : INFO ] > "
  local ERROR="[ ZOMBOB : ERROR ] > "
  local PREFIX
  [ "$1" == "-e" ] && PREFIX=$ERROR || PREFIX=$INFO

  echo "$PREFIX $MESSAGE" > "$ZOMBOB_DATA_CONSOLE_FILE_PATH"
}
