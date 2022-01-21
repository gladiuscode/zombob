#!/bin/bash

ARG=$1

executeCommand() {
  echo "[ ZOMBOB ] > Message sent > $1"
  screen -S server -X stuff "servermsg \"$1\"^M"
}

if [ -z "$ARG" ]
then
  echo "[ ZOMBOB ] > Please write your message: "
  read -r MESSAGE
  executeCommand "$MESSAGE"
  exit 1
fi

executeCommand "$ARG"
