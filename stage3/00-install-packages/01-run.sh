!/bin/bash -e

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/user/"
install -v -o 1000 -g 1000 -m 644 "files/satcom_simulator_client.service" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/systemd/user/satcom_simulator_client.service"
install -v -m 644 "files/allow_user_podman_api.service" "${ROOTFS_DIR}/etc/systemd/system/allow_user_podman_api.service"
install -v -o 1000 -g 1000 -m 600 "secrets/.podman.auth.json" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.podman.auth.json"

# TODO set hostname based on uuid or smth
# TODO make this workk
on_chroot << EOF
  sudo systemctl enable allow_user_podman_api.service
  systemctl --user enable satcom_simulator_client.service
  sudo usermod -aG spi ${FIRST_USER_NAME}
  sudo usermod -aG i2c ${FIRST_USER_NAME}
  sudo usermod -aG gpio ${FIRST_USER_NAME} 
  sudo loginctl enable-linger ${FIRST_USER_NAME}
EOF
#   sudo setfacl --modify user:$FIRST_USER_NAME:rw /run/podman/podman.sock
# sudo usermod -aG spi levo
# sudo usermod -aG i2c levo
# sudo usermod -aG gpio levo  
# loginctl enable-linger 1000 