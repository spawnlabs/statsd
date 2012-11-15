#!/bin/sh

set -e

if [ "$1" = "purge" ]
then
    rm -rf /opt/statsd
    userdel statsd
fi

#DEBHELPER#
