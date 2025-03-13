#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

dnf5 -y copr enable bieszczaders/kernel-cachyos 
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y copr enable ublue/os-akmods
dnf5 -y update



dnf5 -y install kernel-cachyos-rt kernel-cachyos-rt-devel-matched
dnf5 -y install libcap-ng libcap-ng-devel procps-ng procps-ng-devel



dnf5 install -y uksmd
dnf5 install -y tmux
dnf5 install -y bottles





# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

dnf5 -y copr disable bieszczaders/kernel-cachyos
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons
dnf5 -y copr disable ublue/os-akmods

systemctl enable podman.socket
systemctl enable --now uksmd.service

uksmdstats

systemctl list-units | grep uksmd
