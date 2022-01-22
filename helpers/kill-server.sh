#!/bin/bash

killServer() {
  screen -ls | grep server | cut -d. -f1 | awk '{print $1}' | xargs kill
}
