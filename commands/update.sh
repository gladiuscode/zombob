#!/bin/bash

STEAMCMD_PATH=$1

$STEAMCMD_PATH +login anonymous +app_update 380870 validate +quit

echo "Server update completed"
