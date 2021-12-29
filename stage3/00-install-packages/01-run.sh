!/bin/bash -e

install -v -o 1000 -g 1000 -m 644 "files/satcom_simulator_client.service" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/user/satcom_simulator_client.service"

on_chroot << EOF
  /usr/bin/setfacl --modify user:$FIRST_USER_NAME:rw /run/podman/podman.sock
EOF
