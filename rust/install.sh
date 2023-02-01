#!/bin/zsh

# Install Rust if it is not installed
if ! command -v rustup &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Installed Rust."
fi
