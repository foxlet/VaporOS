#!/bin/sh

mkdir -p /usr/share/factory/var/lib

cd /root && find ./ -maxdepth 1 -mindepth 1 -exec mv -t /usr/share/factory/root/ {} +
#mv /var/lib/pacman /usr/share/factory/var/lib/
mv /var/lib/modules /usr/share/factory/var/lib/
mv /var/lib/dkms /usr/share/factory/var/lib/

# FIXME: maybe the db can be placed here from bootstrap
mkdir -p /usr/lib/holo
mv /var/lib/pacman /usr/lib/holo/pacmandb

rm -r /var/*
