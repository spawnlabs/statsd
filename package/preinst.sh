#!/bin/sh

set -eu

USER="statsd"
GROUP="spawnlabs"
HOME="/opt/statsd"

# If we use NIS then errors should be tolerated.
if which ypwhich >/dev/null 2>&1 && ypwhich >/dev/null 2>&1
then
	set +e
fi

if ! getent group $GROUP >/dev/null
then
	addgroup --system $GROUP >/dev/null
fi

# creating user if it isn't already there
if ! getent passwd $USER >/dev/null
then
        adduser \
          --system \
          --disabled-login \
          --ingroup $GROUP \
          --home $HOME \
          --gecos "$USER server" \
          --shell /bin/false \
          $USER  >/dev/null
fi

# end of NIS tolerance zone
set -e

#DEBHELPER#
