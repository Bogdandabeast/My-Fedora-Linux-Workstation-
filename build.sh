#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# Crear el archivo del repositorio
tee /etc/yum.repos.d/cloudflare-warp.repo << EOF
[cloudflare-warp-stable]
name=cloudflare-warp-stable
baseurl=https://pkg.cloudflareclient.com/rpm
enabled=1
type=rpm
gpgcheck=1
gpgkey=https://pkg.cloudflareclient.com/pubkey.gpg
EOF

# Actualizar la caché de dnf
dnf makecache

# Verificar que el repositorio esté añadido
dnf repolist




dnf install -y cloudflare-warp && dnf clean all

echo "ResolveUnicastSingleLabel=yes" | tee -a /etc/systemd/resolved.conf









# Use a COPR Example:
#
# dnf -y copr enable ublue-os/staging
# dnf -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf -y copr disable ublue-os/staging

#### Example for enabling a System Unit File



systemctl enable podman.socket
systemctl enable systemd-resolved

bootc container lint 





