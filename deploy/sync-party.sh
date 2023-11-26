#!/bin/bash

mkdir -p /root/sync-party

docker pull ghcr.io/trickypr/sync-party-docker:main
docker run -d --restart unless-stopped -p 3000:3000 -p 4000:4000 -v /root/sync-party:/app/data:rw ghcr.io/trickypr/sync-party-docker:main

# Setup the CLI
chmod +x cli/*
cp cli/sync-party /usr/local/bin/sync-party
cp cli/sync-party-admins /usr/local/bin/sync-party-admins
cp cli/sync-party-users /usr/local/bin/sync-party-users
