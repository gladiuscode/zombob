#!/bin/bash

sendMessage() {
  echo "[ ZOMBOB : INFO ] > Send Message started"

  checkServerStatus "down"

  if [ -z "$1" ]
  then
    echo "[ ZOMBOB : INFO ] > Please write your message: "
    read -r MESSAGE
    sendServerMessage "$MESSAGE"
  else
    sendServerMessage "$1"
  fi

  echo "[ ZOMBOB : INFO ] > Send Message completed"
}
