#!/bin/bash -ex

install -m 644 files/main-app.service "${ROOTFS_DIR}/etc/systemd/system/main-app.service"

on_chroot << EOF
systemctl enable main-app.service
EOF
