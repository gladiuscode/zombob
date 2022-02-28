#!/bin/bash

sendServerCommand() {
  logger "[ SEND_SERVER_COMMAND ] START"

  screen -S "$SCREEN_SERVER_NAME" -X stuff "$1^M"

  logger "[ SEND_SERVER_MESSAGE ] END"
}

sendServerMessage() {
  logger "[ SEND_SERVER_MESSAGE ] START"

  local MESSAGE="servermsg \"$1\""
  sendServerCommand "$MESSAGE"

  logger "[ SEND_SERVER_MESSAGE ] END"
}
