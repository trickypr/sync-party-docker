#!/bin/bash

docker pull ghcr.io/trickypr/sync-party-docker:main
docker run --restart unless-stopped ghcr.io/trickypr/sync-party-docker:main
