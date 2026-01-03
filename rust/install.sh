#!/bin/zsh

# Install Rust if it is not installed
if ! command -v rustup &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Installed Rust."
fi

# Generate tab completions
echo "Generating tab completions for rustup..."
rustup completions zsh > ~/.zfunc/_rustup

# Make sure Rust is up to date
echo "Updating Rust..."
rustup update stable

# Compilation targets
echo "Adding compilation targets..."
rustup target add wasm32-unknown-unknown # Rust to WASM
rustup target add aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim # iOS

echo "Rust is ready to use."
