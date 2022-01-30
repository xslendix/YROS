#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"

. "${BR2_EXTERNAL_YROS_PATH}/meta"
. "${BOARD_DIR}/meta"

# Write os-release
{
    echo "NAME=\"${YROS_NAME}\""
    echo "VERSION=\"${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD} ${BOARD_NAME}\""
    echo "ID=${YROS_ID}"
    echo "PRETTY_NAME=\"${YROS_NAME} ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_BUILD} ${BOARD_NAME}\""
    echo "HOME_URL=https://github.com/xslendix/YROS"
    echo "SUPPORT_URL=https://github.com/xslendix/YROS/issues"
} > "${TARGET_DIR}/usr/lib/os-release"

# Write machine-info
{
    echo "CHASSIS=${CHASSIS}"
    echo "DEPLOYMENT=${DEPLOYMENT}"
} > "${TARGET_DIR}/etc/machine-info"

cp -vf ../buildroot-external/board/raspberrypi/config.txt ${BINARIES_DIR}/rpi-firmware/config.txt
cp -vf ../buildroot-external/board/raspberrypi/cmdline.txt ${BINARIES_DIR}/rpi-firmware/cmdline.txt 

# cp package/busybox/S10mdev ${TARGET_DIR}/etc/init.d/S10mdev
# chmod 755 ${TARGET_DIR}/etc/init.d/S10mdev
# cp package/busybox/mdev.conf ${TARGET_DIR}/etc/mdev.conf
