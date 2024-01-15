#!/bin/sh

mkdir -p /usr/share/factory/var/lib

cd /root && find ./ -maxdepth 1 -mindepth 1 -exec mv -t /usr/share/factory/root/ {} +
cp -r /var/lib/pacman /usr/share/factory/var/lib/
cp -r /var/lib/modules /usr/share/factory/var/lib/
cp -r /var/lib/dkms /usr/share/factory/var/lib/
