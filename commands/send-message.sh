#!/bin/bash

ARG=$1

serverProcess=$(pgrep -f start-server)
[ -z "$serverProcess" ] && echo "Server is down. Please start it to send message" && exit 0

cleanMessage() {
  MESSAGE_TO_CLEAN=$1
  MESSAGE="${MESSAGE_TO_CLEAN// /-}"
}

executeCommand() {
  echo "[ ZOMBOB ] > Message sent > $1"
  screen -S server -X stuff "servermsg $1^M"
}

if [ -z "$ARG" ]
then
  echo "[ ZOMBOB ] > Please write your message: "
  read -r rawMessage
  cleanMessage "$rawMessage"
  executeCommand $MESSAGE
  exit 1
fi

cleanMessage "$ARG"
executeCommand $MESSAGE


