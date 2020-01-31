#!/bin/sh
/usr/libexec/lxc/lxc-net start
rm -f /run/xtables.lock
exec su-exec rootless:rootless dockerd-entrypoint.sh "$@"
