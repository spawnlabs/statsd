#!/bin/bash

# get required files to build
rm -rf target
$SPAWNENV/bin/spawn-retrieve

mkdir -p target/src/opt
tar -xvf target/lib/default/statsd.tar.gz
mv statsd* target/src/opt/statsd

# create an ubuntu package
echo "packaging statsd"
cd package 
./package.sh > package.log
    
if [ "$?" != "0" ]; then
    echo "package phase failed"
    exit 1
fi

mv ./target ..
cd ..

echo "publishing statsd debs"
$SPAWNENV/bin/spawn-publish --conf deb > target/spawn-publish.log 2>&1

if [ "$?" != "0" ]; then
    echo "publish failed"
    exit 1
fi
