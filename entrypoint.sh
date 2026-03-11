#!/bin/sh
set -e

# Railway mounts the disk owned by root
# Fix permissions so node can write dynamically
if [ -d /paperclip ]; then
  chown node:node /paperclip || true
fi

# Drop privileges and run the server
exec gosu node node --import ./server/node_modules/tsx/dist/loader.mjs server/dist/index.js