#!/bin/bash -ex

mkdir -p ./tmp

if [ "$NODE_VERSION" != "" ]; then

  if [ ! -f ./tmp/node-$NODE_VERSION-linux-armv6l.tar.gz ]; then
    wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-armv6l.tar.gz -O ./tmp/node-$NODE_VERSION-linux-armv6l.tar.gz
  fi

  mkdir -p ./files

  tar -xzf ./tmp/node-$NODE_VERSION-linux-armv6l.tar.gz -C files/

  chown 1000:1000 "files/node-$NODE_VERSION-linux-armv6l" -Rv

  cp -R files/node-$NODE_VERSION-linux-armv6l/* "${ROOTFS_DIR}/usr/local/"

fi
