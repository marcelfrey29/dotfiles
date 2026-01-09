#!/bin/zsh

# Install Linux Packages via APT Package Manager.

# List of Packages to install
declare packageList=(
    # Terminal
    "zsh" 
    "starship"
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
