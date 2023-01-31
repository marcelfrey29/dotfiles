#!/bin/zsh

# Install Homebrew if it is not installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Installed Homebrew."
fi

# Add Repository
echo "Adding Repositories..."
brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install packages
echo "Installing packages..."
./formulae.sh
./casks.sh

# Update outdated packages
echo "Following packages are outdated:"
brew outdated
echo "Updating outdated packages..."
brew upgrade

# Cleanup
echo "Cleaning up..."
brew cleanup

echo "Homebrew and all packages are installed & up-to-date."
