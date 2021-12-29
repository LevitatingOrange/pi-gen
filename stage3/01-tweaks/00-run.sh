#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_wait 1
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_i2c 1
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_spi 1
EOF
