#!/bin/bash

sendServerCommand() {
  screen -S "$SCREEN_SERVER_NAME" -X stuff "$1^M"
}

sendServerMessage() {
  MESSAGE="servermsg \"$1\""
  sendScreenCommand "$MESSAGE"
}
