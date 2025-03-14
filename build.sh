#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

dnf -y copr enable bieszczaders/kernel-cachyos-lto # For LLVM-ThinLTO build kernels
dnf -y copr enable bieszczaders/kernel-cachyos-addons
dnf -y update



dnf remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra -y && dnf install kernel-cachyos-lto kernel-cachyos-lto-devel-matched libcap-ng libcap-ng-devel procps-ng procps-ng-devel -y

setsebool -P domain_kernel_load_modules on

dnf install -y bottles ananicy-cpp cachyos-settings --allowerasing


dracut -f --kver $(uname -r)







# Use a COPR Example:
#
# dnf -y copr enable ublue-os/staging
# dnf -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf -y copr disable ublue-os/staging

#### Example for enabling a System Unit File



systemctl enable podman.socket
systemctl enable --now ananicy-cpp




dnf -y copr disable bieszczaders/kernel-cachyos-lto # For LLVM-ThinLTO build kernels
dnf -y copr disable bieszczaders/kernel-cachyos-addons




