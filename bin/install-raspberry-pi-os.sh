#!/bin/bash

# Ensure we run on macOS
if [ "$(uname)" != "Darwin" ]
then
    echo "[ERROR] This script requires macOS ('Darwin')"
    exit 1;
fi

# Make sure Raspberry Pi OS Image exists, otherwise download the latest version
if [ ! -f "RaspberryPiOS.img" ]; then
    echo "[INFO] Raspberry Pi OS Image isn't availble, downloading..."
    curl -L --progress-bar -o RaspberryPiOS.img.xz https://downloads.raspberrypi.com/raspios_lite_arm64_latest 
    unxz RaspberryPiOS.img.xz
    echo "[INFO] Downloaded Raspberry Pi OS."
fi

# Print Disk info
echo "[INFO] Select the disk you want to install RaspberryPiOS..."
echo "[INFO] Only type the name of the disk, e.g. 'disk2'"
diskutil list;

# Read disk name
echo -n "Disk to install RaspberryPiOS: "
read diskName;

# Print relevant information to confirm
echo "[INFO] You selected '$diskName'. "
diskutil info $diskName | grep "Identifier"
diskutil info $diskName | grep "Node"
diskutil info $diskName | grep "Disk Size"

# Confirmation
echo "[INFO] Writing to the wrong disk can damage your primary operating system!"
echo -n "Continue (y/n): "
read confirmation

if [ "$confirmation" = "y" ]
then
    echo "[INFO] Installation confirmed..."

    # If there are permission errors, make sure that the tool
    # (Terminal, IntelliJ, ...) can access 'Removable Volumes'
    # Settings -> Security & Privacy -> Privacy -> Files and Folders
    diskutil unmountDisk /dev/$diskName

    # Erase the SD Card
    # The Partition Table might be protected against overriding.
    # Erasing the Card will fix this problem.
    sudo diskutil partitionDisk /dev/$diskName 1 MBR "Free Space" "%noformat%" 100%

    # Write new OS
    sudo dd bs=1m if=RaspberryPiOS.img of=/dev/r$diskName; sync

    # Create SSH File for headless access
    echo "[INFO] RaspberryPiOS is now installed."

    echo "[INFO] Creating SSH file..."
    diskutil mountDisk /dev/$diskName
    cd /Volumes/bootfs/
    touch ssh
    echo "[INFO] SSH file created."

    # Create Userconfig with Username+Password (`username:encrypted_pw`) for headless access
    echo "[INFO] Configure User..."
    echo -n "Username for the Raspberry: "
    read rpiUsername
    echo -n "Password for the Raspberry User '$rpiUsername': "
    read -s rpiPassword
    echo
    echo "$rpiUsername:$(echo "$rpiPassword" | openssl passwd -6 -stdin)" >> userconf.txt
    echo "[INFO] Configured User."

    # Eject and finish
    echo "[INFO] Installation finished. Ejecting..."
    sudo diskutil eject /dev/r$diskName
    echo "[INFO] Ejected. Done."

else
    echo "[INFO] Installation cancelled."
    exit 1;
fi
