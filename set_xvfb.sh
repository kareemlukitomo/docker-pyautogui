#!/bin/bash
set -x
# Set default resolution if not provided
export WIDTH=${WIDTH:-1024}
export HEIGHT=${HEIGHT:-768}
export DEPTH=${DEPTH:-24}

# Generate a random cookie
COOKIE=$(openssl rand -hex 16)

# Create .Xauthority file and add the cookie
touch ~/.Xauthority
xauth add ${HOSTNAME}/unix:99 MIT-MAGIC-COOKIE-1 $COOKIE

# Start Xvfb
Xvfb :99 -screen 0 ${WIDTH}x${HEIGHT}x${DEPTH} > /dev/null 2>&1 &

# Execute the command passed to the entrypoint
set +x
exec "$@"
