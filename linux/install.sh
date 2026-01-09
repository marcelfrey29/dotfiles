#!/usr/bin/env bash

# Install Linux Packages via APT Package Manager.

# List of Packages to install
declare packageList=(
    # Terminal
    "zsh" 
    # "starship" # Not always available via APT, will be installed manually below
    "fzf"
    # Core Utils
    "git"
    "vim"
    "curl"
    "wget"
    "dnsutils"
    "rsync"
    # Developer Tools
    "jq"
)

# Install packages via APT
# $1: array<string> the list of casks to install
function installFromList() {
    list=("$@")
    echo "Updating package lists..."
    apt-get update
    echo "Package lists updated."

    echo "Installing Linux Packages..."
    for package in "${list[@]}"; do
        echo "Installing \"$package\"..."
        apt-get install -y "$package"
        echo "Installed \"$package\"."
    done
    echo "Installed Linux Packages."
}

installFromList "${packageList[@]}"

# Use zsh as the default shell
chsh -s /bin/zsh
echo "Changed default shell to zsh."

# Install Starship because it's not always available via APT (e.g. Debian <= 12)
curl -sS https://starship.rs/install.sh | sh -s -- -y
