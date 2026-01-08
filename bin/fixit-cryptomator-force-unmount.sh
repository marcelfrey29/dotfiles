#!/bin/zsh

# echo "Closing Cryptomator..."
# pkill -x Cryptomator;

echo "Unmounting Cryptomator Mount Directories..."

sudo diskutil unmount force /Users/marcelfrey/Marcels-Documents
sudo diskutil unmount force /Users/marcelfrey/Marcels-Images
sudo diskutil unmount force /Users/marcelfrey/Marcels-Music
sudo diskutil unmount force /Users/marcelfrey/Marcels-Videos
sudo diskutil unmount force /Users/marcelfrey/Marcels-Workspaces

echo "Unmounted. Launching Cryptomator..."

open -a Cryptomator;

echo "Done."
