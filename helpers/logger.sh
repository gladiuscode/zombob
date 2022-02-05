#!/bin/bash

logger() {
  [ "$1" == "-s" ] || [ "$1" == "-e" ] && MESSAGE=$2 || MESSAGE=$1

  if [ "$AGENT" == "BOT" ]
  then
    [ "$1" == "-s" ] && echo "$MESSAGE"
    return
  fi

  INFO="[ ZOMBOB : INFO ] > "
  ERROR="[ ZOMBOB : ERROR ] > "

  if [ "$1" == "-e" ]
  then
    echo "$ERROR $MESSAGE"
    return
  fi
  [ "$1" != "-s" ] && echo "$INFO $MESSAGE"
}
