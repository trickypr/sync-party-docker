#!/bin/bash

./deploy/install.sh
./deploy/nginx.sh
./deploy/certbot.sh
./deploy/sync-party.sh
