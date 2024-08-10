#!/bin/bash
set -x
export DISPLAY=:99.0

touch ~/.Xauthority
xauth add box/unix:0  MIT-MAGIC-COOKIE-1  dbc4ba56e43ea134b3f7a7befd232bdb
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
#sleep 3
set +x
exec "$@"