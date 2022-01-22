#!/bin/bash

setStartupDate() {
    STARTUP_DATE=$( date +"%s" )
    touch "$ENV_FILE_PATH"
    echo "$STARTUP_DATE" > "$ENV_FILE_PATH"
}

resetStartupDate() {
    rm "$ENV_FILE_PATH"
}
