#!/bin/sh

set -e

if [ "$1" = "purge" ]
then
    rm -f /etc/init.d/statsd
    rm -f /etc/statsd/localConfig.js
    rm -rf /opt/statsd
    userdel statsd
fi

#DEBHELPER#
