#!/usr/bin/env bash

# Reference: 
# - https://macos-defaults.com/
# - https://github.com/herrbischoff/awesome-macos-command-line
# - https://github.com/kevinSuttle/macOS-Defaults

echo "Seeting macOS Defaults..."

# Dock
defaults write com.apple.dock orientation -string bottom; # Dock position ("left" | "bottom" | "right")
defaults write com.apple.dock tilesize -int 40; # Icon Size
defaults write com.apple.dock magnification -bool false; # Magnify on hover
defaults write com.apple.dock autohide -bool false; # Auto. hide/sow dock
defaults write com.apple.dock autohide-time-modifier -float 0.75; # Time to open/close dock when auto. hide is enabled
defaults write com.apple.dock autohide-delay -float 0; # Time to open/close dock until the dock is shown/hidden
defaults write com.apple.dock show-recents -bool true; # Show recent apps
defaults write com.apple.dock mineffect -string scale; # Minimize apps animation ("genie", "scale", "suck")
defaults write com.apple.dock minimize-to-application -bool true; # Minimize into app icon
defaults write com.apple.dock show-process-indicators -bool true; # Show progress indicators on app icon
defaults write com.apple.dock size-immutable -bool true; # Prevent resizing
defaults write com.apple.dock static-only -bool false; # Show only opened apps

# Menubar
defaults write com.apple.menuextra.clock IsAnalog -bool false; # Analog / Digital (digital = false)
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"; # Date&Time Format
defaults write com.apple.menuextra.clock ShowSeconds -bool false; # Show seconds
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false; # Date seperator flashes every second

# Finder - General
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2; # Icon size in sidebars (1, 2, 3)
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" # Finder bar folder name hover delay (default = 0.5)
defaults write -g AppleShowScrollBars -string "Always"; # Scrollbar visibility ("WhenScrolling" | "Automatic" | "Always")

# Finder - Application
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # Show file extensions
defaults write com.apple.finder AppleShowAllFiles -bool false; # Show all files
defaults write com.apple.finder ShowPathbar -bool true; # Show breadcrumbs
defaults write com.apple.finder ShowStatusBar -bool true; # Show status bar
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"; # Use "List View" as default view
defaults write com.apple.finder _FXSortFoldersFirst -bool true; # Keep folders on top when sorting alphabetically
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false; # No warning when changing file extensions

# Finder - Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false; # Show internal drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false; # Show external drives on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false; # Show CD/DVD on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false; # Show network mounts on desktop

# Keyboard
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool false; # Disable holding a key to show an overlay with additional options (e.g. holding "a" for "ä", "â", ...)
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false; # Disable "press and hold" for VS Code Vim, so that navigation works smoothly, see https://github.com/VSCodeVim/Vim#mac 

# Screenshot App
defaults write com.apple.screencapture disable-shadow -bool true; # Disable shadow around the application 

# Restart all services
echo "Restarting Services..."
killall Dock;
killall Finder;
echo "Restart Done."

echo "Set Defaults."
