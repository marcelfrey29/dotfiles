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

# Install Homebrew if it is not installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv zsh)"
    echo "Installed Homebrew."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages
echo "Installing packages..."
./formulae.sh
if [ "$FULL_OS" = true ]; then
    ./casks.sh --full-os
else
    ./casks.sh
fi

# Update outdated packages
echo "Following packages are outdated:"
brew outdated
echo "Updating outdated packages..."
brew upgrade

# Cleanup
echo "Cleaning up..."
brew cleanup

echo "Homebrew and all packages are installed & up-to-date."
