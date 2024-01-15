#!/bin/sh

if id "deck" >/dev/null 2>&1; then
    userdel deck
fi
# useradd -G wheel,gamemode steamos
useradd -u 1000 -G wheel,gamemode deck
usermod -c "VaporOS User" deck
echo "deck:steamos" | chpasswd
