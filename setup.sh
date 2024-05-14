#!/usr/bin/env bash

set -euo pipefail

if [[ "$(lsb_release --release --short)" == "22.04" ]]; then
  curl -f -L --retry 5 "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/unstable/xUbuntu_22.04/Release.key" | sudo gpg --dearmor -o /usr/share/keyrings/devel_kubic_libcontainers_unstable.gpg

  echo "deb [signed-by=/usr/share/keyrings/devel_kubic_libcontainers_unstable.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/unstable/xUbuntu_22.04 /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:unstable.list
fi

sudo apt update

exec sudo apt install -y \
  buildah \
  conmon \
  crun \
  fuse-overlayfs \
  podman \
  qemu-user-static \
  skopeo \
  slirp4netns
