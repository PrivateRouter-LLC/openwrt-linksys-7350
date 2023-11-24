#!/bin/bash

OUTPUT="$(pwd)/images"
BUILD_VERSION="21.02.6"
BOARD_NAME="ramips"
BOARD_SUBNAME="mt7621"
BUILDER="https://downloads.openwrt.org/releases/23.05.0-rc3/targets/ramips/mt7621/openwrt-imagebuilder-23.05.0-rc3-ramips-mt7621.Linux-x86_64.tar.xz"
BASEDIR=$(realpath "$0" | xargs dirname)

# download image builder
if [ ! -f "${BUILDER##*/}" ]; then
	wget "$BUILDER"
	tar xJvf "${BUILDER##*/}"
fi

[ -d "${OUTPUT}" ] || mkdir "${OUTPUT}"

cd openwrt-*/

# clean previous images
make clean

make image  PROFILE="linksys_e7350" \
           PACKAGES="block-mount kmod-fs-ext4 kmod-usb-storage blkid mount-utils swap-utils e2fsprogs fdisk luci dnsmasq bash" \
           FILES="/home/ben/mesh-openwrt/linksys_7350_AXmini/build/openwrt-linksys-7350/files/" \
           BIN_DIR="/home/ben/mesh-openwrt/linksys_7350_AXmini/build/openwrt-linksys-7350/images/"
