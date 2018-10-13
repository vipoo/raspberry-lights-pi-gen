#!/bin/bash -ex

mkdir ./tmp

if [ "$WIFI_PSK" != "" ]; then
cat <<EOT >> ./tmp/wpa_supplicant.conf
country=AU
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  ssid="d&v"
  psk=$WIFI_PSK
}
EOT
else
cat <<EOT >> ./tmp/wpa_supplicant.conf
country=AU
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
EOT
fi

install -v -d                     "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d"
install -v -m 644 files/wait.conf "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/"

install -v -d                               "${ROOTFS_DIR}/etc/wpa_supplicant"
install -v -m 600 ./tmp/wpa_supplicant.conf "${ROOTFS_DIR}/etc/wpa_supplicant/"

