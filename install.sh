#!/bin/zsh

echo "Setting up..."

# Run install scripts
echo "Running installation scripts..."
(cd ./homebrew ; ./install.sh) # otherwise the formulae and cask scripts are not found 
./macos/install.sh
./nodejs/install.sh
./rust/install.sh
(cd ./vscode ; ./install.sh)

# Copy to Home
echo "Copying data to Home directory..."
rsync \
    --exclude ".git/" \
    --exclude "bin" \
    --exclude "homebrew" \
    --exclude "macos" \
    --exclude "nodejs" \
    --exclude "rust" \
    --exclude "vscode" \
    --exclude "install.sh" \
    --exclude "README.md" \
    -vrh \
    . ~;

rsync \
    -vrh \
    ./bin/ ~/.bin;

# Apply Home Config
echo "Source .zshrc to apply latest changes..."
source ~/.zshrc

echo "Setup complete."
