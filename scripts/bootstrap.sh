#!/bin/bash

echo "This script will download & install Sync Party using docker."

echo "Esnure unzip is installed."
apt install unzip

(
  cd /tmp || exit
  wget https://github.com/trickypr/sync-party-docker/archive/refs/heads/main.zip
  unzip main.zip
  cd sync-party-docker-main || exit
  chmod +x ./deploy/*.sh
  ./deploy/_setup.sh
)
