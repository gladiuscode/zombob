#!/bin/bash

killServer() {
  echo "Killing screen and server"
  screen -ls | grep "$SCREEN_SERVER_NAME" | cut -d. -f1 | awk '{print $1}' | xargs kill
}
