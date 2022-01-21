#!/bin/bash

serverProcess=$(pgrep -f start-server)

if [ -n "$serverProcess" ]
then
  echo "Server is up"
  exit 1
fi

exit 0
