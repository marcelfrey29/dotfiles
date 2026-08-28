#!/usr/bin/env bash

# Parse command line arguments
FULL_OS=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --full-os)
            FULL_OS=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--full-os]"
            exit 1
            ;;
    esac
done

echo "Installing Homebrew Casks with FULL_OS=$FULL_OS..."

# Install packages via homebrew
# $1: array<string> the list of casks to install
function brew_cask_install() {
    list=("$@")
    installed=($(brew list --cask))

    for list_item in "${list[@]}"; do
        if [[ "${installed[@]}" =~ "$list_item" ]]; then
            echo "\"$list_item\" is already installed."
        else
            echo "Installing \"$list_item\"..."
            brew install --cask "$list_item"
            echo "Installed \"$list_item\"."
        fi
    done
}

# Cask List (Minimal, e.g. for VMs)
declare homebrew_cask_list=(
    # Browsers
    "firefox"
    # "firefox@developer-edition"
    # "google-chrome"
    # "google-chrome@dev"
    # "safari-technology-preview"
    # Developer Tools
    "zed"
    "visual-studio-code"
    "podman"
    # "docker"
    # "burp-suite"
    "ollama"
    # Fonts
    "font-jetbrains-mono"
    "font-fira-code"
)

brew_cask_install "${homebrew_cask_list[@]}"

# Cask List (Full OS)
declare homebrew_cask_list_full_os=(
    # Productivity
    "nextcloud"
    "obsidian"
    "firefox"
    # "firefox@developer-edition"
    # "google-chrome"
    # "google-chrome@dev"
    # "safari-technology-preview"
    # "microsoft-word"
    # "microsoft-excel"
    # "microsoft-powerpoint"
    # "microsoft-onenote"
    # "microsoft-outlook"
    "zotero"
    # Developer Tools
    "zed"
    "visual-studio-code"
    # "jetbrains-toolbox"
    # "teamviewer"
    # "virtualbox" # Incompatible with Apple Silicon
    # "utm"
    # "vagrant"
    # "container"
    "podman"
    # "docker"
    "drawio"
    # Security
    "cryptomator"
    "macfuse" # For Cryptomator File System Integration
    "keepassxc"
    # "burp-suite"
    # AI
    "ollama"
    # Entertainment
    "vlc"
    # "spotify"
    # Social Media
    # "webex-meetings"
    # "zoom"
    # "microsoft-teams"
    # "discord"
    # Fonts
    "font-jetbrains-mono"
    "font-fira-code"
)

if [ "$FULL_OS" = true ]; then
    echo "Installing all Applications..."
    brew_cask_install "${homebrew_cask_list_full_os[@]}"
fi

echo "Installed Casks."
