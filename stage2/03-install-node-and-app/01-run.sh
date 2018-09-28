#!/bin/bash -ex

#wget https://nodejs.org/dist/v8.12.0/node-v8.12.0-linux-armv6l.tar.gz -O files/node-v8.12.0-linux-armv6l.tar.gz
tar -xzf files/node-v8.12.0-linux-armv6l.tar.gz -C files/
chown 1000:1000 "files/node-v8.12.0-linux-armv6l" -Rv
cp -R files/node-v8.12.0-linux-armv6l/* "${ROOTFS_DIR}/usr/local/"

install -v -m 644 files/modules             "${ROOTFS_DIR}/etc/modules"
install -v -m 644 files/lirc_options.conf   "${ROOTFS_DIR}/etc/lirc/lirc_options.conf"
install -v -m 644 files/ledstrip.lircd.conf "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/ledstrip.lircd.conf"

