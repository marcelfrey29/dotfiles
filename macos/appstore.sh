#!/usr/bin/env bash

# Install Mac App Store Apps with MAS CLI.
# Installation is done by APP ID.
#
# From an app page in the App Store, choose "Share" -> "Copy Link" and extract the ID from the URL.
# E.g. `904280696` from https://apps.apple.com/de/app/things-3/id904280696?l=en-GB&mt=12 (Things 3)
#
# Apps need to be "owned" by the Apple ID used to sign in to the App Store on this Mac.

echo "Installing Mac App Store Apps..."

mas install 441258766 # Magnet (Window Manager)
mas install 904280696 # Things 3
mas install 497799835 # Xcode
# iPhone/iPad Apps are not yet supported: https://github.com/mas-cli/mas/issues/321
# mas install 986420993 # DWD WarnWetter (iPhone/iPad App)

# Update all apps
mas update

echo "Installed Mac App Store Apps."
