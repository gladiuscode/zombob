#!/bin/bash

sendServerCommand() {
  screen -S server -X stuff "$1^M"
}

sendServerMessage() {
  MESSAGE="servermsg \"$1\""
  sendScreenCommand "$MESSAGE"
}
