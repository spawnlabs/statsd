#!/bin/bash 

PACKAGENM="statsd"

if [ -z "$SPAWNENV" ]; then
    echo "SPAWNENV not defined. Please install spawnenv and make an environment variable called SPAWNENV pointing to the install."
    exit 1
fi

set -e 

mv ../target ./

$SPAWNENV/bin/spawn-version --output target/spawnversion.sh --style bash

source target/spawnversion.sh

if [ "$SPAWNENV_PROJECT_BUILDNO" = "local" ]; then
	SPAWNENV_PROJECT_BUILDNO="1"
fi

# Make the required dirs
mkdir -p target/src/opt/$PACKAGENM
mkdir -p target/src/etc/$PACKAGENM
mkdir -p target/src/etc/init.d
mkdir -p target/deb

echo "building $PACKAGENM debian using fpm"
fpm -s dir -t deb -a all -n $PACKAGE_NAME -v $SPAWNENV_PROJECT_BUILDNO -p target/deb/${PACKAGE_NAME}_${SPAWNENV_PROJECT_BUILDNO}_all.deb --before-remove prerm.sh --after-remove postrm.sh --before-install preinst.sh --after-install postinst.sh -C target/src/$PACKAGENM opt etc 
