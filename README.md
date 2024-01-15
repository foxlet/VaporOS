VaporOS: "I can't believe it's not-SteamOS!"
============================================

This project aims to re-engineer the SteamOS build process from scratch, including support for generating true immutable images and enabling SteamOS-exclusive features such as A/B system boot. This is still relatively experimental, but hey it works.

Caveats
-------
- Gamescope crashes on systems that rely on PRIME offloading for rendering graphics (aka laptops with dual GPUs and no dedicated display mux). For status check out https://github.com/ValveSoftware/gamescope/issues/611
- You must set `"CompletedOOBE"     "1"` in `~/.steam/registry.vdf` if you're running a gamescope session, as there are no dedicated OS update servers online yet
- No quirks have been added for other handheld devices (if you're interested, feel free to make a PR!)

Building
--------

Building on Debian requires installing https://github.com/go-debos/debos and pulling in a few dependencies:
```
sudo apt install sshfs golang git libglib2.0-dev libostree-dev qemu-system-x86 qemu-user-static debootstrap systemd-container systemd-resolved
sudo apt install pacman-package-manager arch-install-scripts
sudo apt install parted dosfstools bmap-tools
sudo usermod -a -G kvm myuser
```

from there you can make a build by calling either `debos-build.sh` or manually invoking one of the manifests:
```
debos --fakemachine-backend=kvm --scratchsize=16GB vapor-steamdeck-main.yaml
```

Manifests
---------
- `vapor-steamdeck-main.yaml`: The "default" config, generates a ready-to-boot image that can be written straight to a disk
- `vapor-steamdeck-recovery.yaml`: The repair config, generates the equivalent to a Steam Deck recovery image for installing onto another drive
