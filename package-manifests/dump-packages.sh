#!/bin/bash

. /etc/os-release
pacman -Qqe > pkglist-$VERSION_ID-$BUILD_ID.txt
