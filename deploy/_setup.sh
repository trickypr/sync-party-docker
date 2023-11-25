#!/bin/bash

read -p "Enter your domain name: " INT_DOMAIN
export DOMAIN=$INT_DOMAIN

./deploy/install.sh
./deploy/nginx.sh
./deploy/certbot.sh
./deploy/sync-party.sh
