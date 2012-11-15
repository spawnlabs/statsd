#!/bin/sh

set -eu

USER="statsd"
GROUP="spawnlabs"

mkdir -p /etc/statsd
mkdir -p /opt/statsd

chown -R $USER:$GROUP /etc/statsd
chown -R $USER:$GROUP /opt/statsd

#DEBHELPER#
