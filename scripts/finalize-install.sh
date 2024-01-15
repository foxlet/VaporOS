#!/bin/bash

export STEAMOS_DEBUG=1

typeset ident
ident=$(steamos-bootconf this-image)
# fallback if there are no bootconfs in /esp, so we can't determine our image name
if [[ -z ${ident} ]]
then
    rootdsk=$(findmnt --noheadings -o PARTLABEL / )
    ident=${rootdsk#rootfs-}
fi

if [[ -z ${ident} ]]
then
    echo "Failed to determine new boot identifier"
    exit 1
fi

steamcl-install --flags restricted
grub-install --target=x86_64-efi

if [[ ! -e /efi/SteamOS ]]
then
    mkdir -p /efi/SteamOS
fi

if [[ ! -e /esp/SteamOS/conf/${ident}.conf ]]
then
    echo "Initializing boot configuration at /esp/SteamOS/conf for ${ident}"
    mkdir -p /esp/SteamOS/conf
    steamos-bootconf --conf-dir /esp/SteamOS/conf create --image ${ident}
fi

mapfile -t linux < <(ls -1 /boot/vmlinuz-* 2>/dev/null)
if [[ "${#linux[*]}" -eq 0 ]]
then
    echo "Warning: /boot: No such vmlinuz!" >&2
fi
mapfile -t initramfs < <(ls -1 /boot/initramfs-*.img 2>/dev/null)
if [[ "${#initramfs[*]}" -eq 0 ]]
then
    echo "Warning: /boot: No such initramfs!" >&2
fi
mapfile -t modules < <(ls -d1 /usr/lib/modules/* 2>/dev/null)
if [[ "${#modules[*]}" -eq 0 ]]
then
    echo "Warning: /usr/lib/modules: No such modules!" >&2
fi
update-grub
