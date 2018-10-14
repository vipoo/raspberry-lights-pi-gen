#!/bin/bash -e


install -m 644 files/ipv6.conf "${ROOTFS_DIR}/etc/modprobe.d/ipv6.conf"

mkdir -p ./tmp
echo $RASPI_HOSTNAME > ./tmp/hostname
install -m 644 ./tmp/hostname "${ROOTFS_DIR}/etc/hostname"

echo "127.0.1.1	 $RASPI_HOSTNAME" >> "${ROOTFS_DIR}/etc/hosts"

ln -sf /dev/null "${ROOTFS_DIR}/etc/systemd/network/99-default.link"
