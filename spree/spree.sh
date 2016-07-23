#!/bin/bash

# Start spree (meteor + mongod + slim)
# Meteor takes a while to start for the first time, because it needs to download dependencies
echo "This script might take a while to run, because meteor needs to download dependencies"
cd $SPREE_HOME/ui
nohup meteor 0<&- &>/dev/null &
while [[ ! $(ps aux | grep -v grep | grep mongod) ]]; do
  PROGRESS="$PROGRESS."
  echo -ne "Start meteor+mongod$PROGRESS\r"
  sleep 5
done
echo -ne "\n"
echo "Start slim in background"
nohup slim 0<&- &>/dev/null &
