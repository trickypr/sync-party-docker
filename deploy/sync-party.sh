#!/bin/bash

mkdir -p /root/sync-party

docker pull ghcr.io/trickypr/sync-party-docker:main
docker run -d --restart unless-stopped -p 3000:3000 -p 4000:4000 -v /app/data:/root/sync-party:rw ghcr.io/trickypr/sync-party-docker:main
