#!/bin/bash

logger() {
  INFO="[ ZOMBOB : INFO ] > "
  ERROR="[ ZOMBOB : ERROR ] > "

  if [ "$AGENT" != "BOT" ] && [ "$1" != '-s' ]
  then
    [ "$1" == "-e" ] && echo "$ERROR $2" || echo "$INFO $1"
    return;
  fi

  if [ "$AGENT" == "BOT" ] && [ "$1" == "-s" ]
  then
    echo "$2"
  fi
}
