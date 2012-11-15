#!/bin/sh

set -e

if [ "$1" = "purge" ]
then
    rm -rf /opt/statsd
    rm -f /etc/init.d/statsd
    rm -f /etc/statsd/localConfig.js
    userdel statsd
fi

#DEBHELPER#
