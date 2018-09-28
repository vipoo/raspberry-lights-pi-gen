#!/bin/bash -ex

install -v -m 644 files/modules             "${ROOTFS_DIR}/etc/modules"
install -v -m 644 files/lirc_options.conf   "${ROOTFS_DIR}/etc/lirc/lirc_options.conf"
install -v -m 644 files/ledstrip.lircd.conf "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/ledstrip.lircd.conf"

