#!/usr/bin/env bash

# This is the central installation script for the dotfiles.
# By default, this script will only setup the core dotfiles configuration, but not the full main OS environment.
# To setup the full main OS environment, run this script with the `--full-os` flag.
#
# 

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

echo "Setting up Dotfiles with FULL_OS=$FULL_OS ..."

# Install OS Packages
# Detect OS and run appropriate installation script
OS="$(uname -s)"
case "$OS" in
    Darwin)
        echo "Detected macOS, running macOS installation scripts..."
        
        # macOS System Config
        if [ "$FULL_OS" = true ]; then
            echo "Running full OS setup for macOS..."
            (cd ./macOS ; ./install.sh)
        fi

        # Homebrew
        (cd ./homebrew ; ./install.sh)
        ;;
    Linux)
        echo "Detected Linux, running Linux installation scripts..."
        
        # Linux System Config
        if [ "$FULL_OS" = true ]; then
            echo "Running full OS setup..."
            # No additional full OS setup for Linux yet
        fi
        
        # Linux Packages
        (cd ./linux ; ./install.sh)
        ;;
    *)
        echo "Error: Unsupported operating system: $OS"
        echo "Only macOS and Linux are supported."
        exit 1
        ;;
esac

# Copy files to home directory
rsync -vrh --exclude ".DS_Store" ./home/ ~

# Copy files that are added to the PATH
mkdir -p ~/.bin/marcelfrey29
rsync -vrh --exclude ".DS_Store" --exclude "*.img*" ./bin/ ~/.bin/marcelfrey29/

# Optional: Full OS setup (e.g. application configuration)
if [ "$FULL_OS" = true ]; then
    echo "Running full OS setup..."
    # VS Code
    (cd ./vscode ; ./install.sh)

    # Ollama
    (cd ./ollama ; ./install.sh)
fi

# Reload terminal config
if [ -n "$ZSH_VERSION" ]; then
    # Running in zsh
    [ -f ~/.zshrc ] && source ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    # Running in bash
    [ -f ~/.bashrc ] && source ~/.bashrc
fi

echo "Dotfiles setup complete."
