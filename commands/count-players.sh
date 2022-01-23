#!/bin/bash

countPlayers() {
  echo "[ ZOMBOB ] > Count Players started"

  checkServerStatus "down"

  sendServerCommand "players"
  sleep 10s

  PLAYERS=$(grep -o "Players.*" "$SERVER_CONSOLE" | tail -1)

  echo "[ ZOMBOB ] > $PLAYERS"

  echo "[ ZOMBOB ] > Count Players stopped"
}
