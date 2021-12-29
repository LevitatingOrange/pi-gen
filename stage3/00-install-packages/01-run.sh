!/bin/bash -e

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/user/"
install -v -o 1000 -g 1000 -m 644 "files/satcom_simulator_client.service" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/user/satcom_simulator_client.service"

# TODO add spi
on_chroot << EOF
  sudo setfacl --modify user:$FIRST_USER_NAME:rw /run/podman/podman.sock
  sudo setfacl --modify user:$FIRST_USER_NAME:rw /dev/gpiochip0
EOF
