#!/bin/bash -e

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_boot_wait 1
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_i2c 1
	SUDO_USER="${FIRST_USER_NAME}" raspi-config nonint do_spi 1
	su ${FIRST_USER_NAME} -c "loginctl enable-linger 1000"
  	su ${FIRST_USER_NAME} -c "systemctl enable --user podman.socket"
  	su ${FIRST_USER_NAME} -c "systemctl enable --user satcom_simulator_client.service"
  	sudo usermod -aG spi ${FIRST_USER_NAME}
  	sudo usermod -aG i2c ${FIRST_USER_NAME}
  	sudo usermod -aG gpio ${FIRST_USER_NAME} 
  	# sudo loginctl enable-linger ${FIRST_USER_NAME}
EOF
