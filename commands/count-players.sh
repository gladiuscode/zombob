#!/bin/bash

CONSOLE_PATH=$1

screen -S server -X stuff "players^M"

sleep 10s

PLAYERS=$(grep -o "Players.*" "$CONSOLE_PATH" | tail -1)

echo "[ ZOMBOB ] > $PLAYERS"
