#!/usr/bin/env bash

set -euo pipefail

VERSION="$(lsb_release --release --short)"

curl -f -L --retry 5 "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/unstable/xUbuntu_$VERSION/Release.key" | sudo gpg --dearmor -o /usr/share/keyrings/devel_kubic_libcontainers_unstable.gpg

echo "deb [signed-by=/usr/share/keyrings/devel_kubic_libcontainers_unstable.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/unstable/xUbuntu_$VERSION /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:unstable.list

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
