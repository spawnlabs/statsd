#!/bin/sh

set -e

if [ "$1" = "purge" ]
then
    rm -f /etc/init/statsd.conf
    rm -rf /opt/statsd
    userdel statsd
fi

#DEBHELPER#
