#!/bin/ash
# shellcheck shell=dash

# Make sure that a .env file is setup
if [ ! -f .env ]; then
  # Generate a random 30 character secret.
  # https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string
  SECRET=$(
    tr -dc A-Za-z0-9 </dev/urandom | head -c 30
    echo
  )

  echo "Initial setup. Generating .env file."
  cat <<EOF >.env
NODE_ENV=production
SERVER_PORT=3000
WEBSOCKETS_PORT=4000
SESSION_SECRET=$SECRET
EOF
fi

[ -e data/ ] || mkdir data
echo "Debug: Node version: $(node --version)"

node ./build/server/index.js
