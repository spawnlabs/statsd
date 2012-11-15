#!/bin/sh

set -eu

USER="statsd"
GROUP="spawnlabs"

mkdir -p /etc/statsd
mkdir -p /opt/statsd
mkdir -p /var/log/statsd

chown -R $USER:$GROUP /etc/statsd
chown -R $USER:$GROUP /opt/statsd

rm -f /etc/init.statsd
ln -s /opt/statsd/debian/statsd.init /etc/init.d/statsd
ln -s /opt/statsd /usr/share/statsd
ln -s /opt/statsd/debian/localConfig.js /etc/statsd/localConfig.js

#DEBHELPER#
