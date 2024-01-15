read -r -d '' MESSAGE << EOD

This is a bootable USB SteamOS recovery image for Steam Deck devices.
For the most common reinstall actions, see the shortcuts on the Plasma desktop.

Reinstallation tools can also be run in a terminal from:
	~/tools/repair_device.sh

To mount the Steam Deck partitions directly in a chroot:
	~/tools/repair_device.sh chroot

To make the system partitions writable within the chroot, run:
	steamos-readonly disable

When your changes are complete, you can reboot the Steam Deck and disconnect the USB device.
To reboot, choose Restart from the Plasma system menu. Or in this terminal:
	systemctl reboot


EOD
echo
echo "$MESSAGE"
echo

alias vi=vim
EDITOR=nano

