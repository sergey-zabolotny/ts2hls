#!/bin/bash

set -e

mkdir -p /tmp/cache/proxy
mkdir -p /tmp/cache/fastcgi
mkdir -p /tmp/cache/status
rm -rf /tmp/htdocs/
mkdir -p /tmp/htdocs

chown -R nginx:nginx /tmp/cache

rm -f /run/fcgiwrap.socket

fcgiwrap -f -s unix:/run/fcgiwrap.socket >/dev/null 2>&1 &

sleep 1
chgrp nginx /run/fcgiwrap.socket
chmod g+w /run/fcgiwrap.socket

exec "$@"
