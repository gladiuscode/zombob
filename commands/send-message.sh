#!/bin/bash

sendMessage() {
  echo "[ZOMBOB] > Send Message started"

  checkServerStatus "down"

  if [ -z "$1" ]
  then
    echo "[ ZOMBOB ] > Please write your message: "
    read -r MESSAGE
    sendServerMessage "$MESSAGE"
  else
    sendServerMessage "$1"
  fi

  echo "[ZOMBOB] > Send Message completed"
}
