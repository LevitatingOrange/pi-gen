!/bin/bash -e

on_chroot << EOF
  sudo setfacl --modify user:$FIRST_USER_NAME:rw /run/podman/podman.sock
EOF
