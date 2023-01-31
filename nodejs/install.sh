#!/bin/zsh

# Install nvm if it is not installed
if ! command -v nvm &> /dev/null; then
    echo "Installing Node Version Manager (nvm)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    echo "Installed nvm."
fi

# Source nvm so that we can use it immediately
source ~/.nvm/nvm.sh

# Install Node.js
echo "Installing Node.js..."
nvm install node  # Install latest version
nvm install --lts # Install the latest LTS

echo "Installed Node.js via Node Version Manager (nvm)."
