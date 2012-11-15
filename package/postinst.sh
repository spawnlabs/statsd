#!/bin/sh

set -eu

USER="statsd"
GROUP="spawnlabs"

mkdir -p /etc/statsd
mkdir -p /opt/statsd
mkdir -p /var/log/statsd

chown -R $USER:$GROUP /etc/statsd
chown -R $USER:$GROUP /opt/statsd

chmod 777 /opt/statsd/debian/scripts/start
cp /opt/statsd/debian/statsd.upstart /etc/init/statsd.conf
ln -fs /opt/statsd /usr/share/statsd
ln -fs /opt/statsd/exampleConfig.js /etc/statsd/localConfig.js
ln -fs /opt/statsd/debian/scripts /opt/statsd/scripts

#DEBHELPER#
