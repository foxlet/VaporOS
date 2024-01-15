#!/bin/sh

systemctl enable sddm.service
systemctl enable NetworkManager.service
systemctl enable sshd.service
#systemctl enable docker.service
systemctl enable systemd-timesyncd.service

# FIXME: repart sometimes breaks the SteamOS esp
#systemctl disable systemd-repart.service
#rm /usr/lib/systemd/system/initrd-root-fs.target.wants/systemd-repart.service
#rm /usr/lib/systemd/system/sysinit.target.wants/systemd-repart.service
