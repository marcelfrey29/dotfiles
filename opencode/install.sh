#!/bin/bash

# This script sets up Open Code by setting the global configuration and making Agents and Skills
# available in the expected directories.
# Open Code itself must be installed in each individual Devcontainer and is therefore not 
# installed here. See the README for details. 

echo "Setting up Open Code..."

# Ensure the Open Code Data directory exists (local and devcontainer)
mkdir -p ~/.opencode/credentials
if [ ! -f "$HOME/.opencode/credentials/auth.json" ]; then
    echo "{}" > ~/.opencode/credentials/auth.json
fi
mkdir -p ~/.local/share/opencode/
if [ ! -f "$HOME/.local/share/opencode.auth.json" ]; then
    echo "{}" > ~/.local/share/opencode.auth.json
fi

# Config
# https://opencode.ai/docs/config/#precedence-order
mkdir -p ~/.config/opencode/
rsync -vrh --exclude ".DS_Store" ./opencode.jsonc ~/.config/opencode/opencode.json

echo "Open Code configuration complete. Keep in mind that open code itself must be installed in each Devcontainer separately. See the README for details."
