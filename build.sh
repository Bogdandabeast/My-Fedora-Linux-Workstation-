#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# Crear el archivo del repositorio
dnf install -y dnf-plugins-core

rpm --import https://packages.microsoft.com/keys/microsoft.asc 
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf config-manager addrepo --from-repofile=https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo
dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# check repos
dnf repolist

mkdir -p /var/opt/brave.com /var/opt/cloudflare-warp

dnf install -y cloudflare-warp code brave-browser && dnf clean all

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

dnf list installed


bootc container lint 





