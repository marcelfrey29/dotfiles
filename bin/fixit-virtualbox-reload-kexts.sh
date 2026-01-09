#!/usr/bin/env bash

# Fix VirtualBox on macOS Monterey.
echo "Fixing VirtualBox on macOS Monterey after a reboot."
echo "Loading Kernel Extensions..."

sudo kextload -b org.virtualbox.kext.VBoxDrv
sudo kextload -b org.virtualbox.kext.VBoxNetFlt
sudo kextload -b org.virtualbox.kext.VBoxNetAdp
sudo kextload -b org.virtualbox.kext.VBoxUSB

echo "Done."
echo "Start VirtualBox."
