#!/bin/bash

logger() {
  INFO="[ ZOMBOB : INFO ] > "
  ERROR="[ ZOMBOB : ERROR ] > "

  if [ "$AGENT" != "BOT" ] && [ "$1" != '-s' ]
  then
    [ "$1" == "-e" ] && echo "$ERROR $2" || echo "$INFO $1"
    return;
  fi

  if [ "$1" != "-s" ]
  then
    return;
  fi

  echo "$2"
}
