#!/bin/zsh

echo "Installing Homebrew Casks..."

# Install packages via homebrew
# $1: array<string> the list of casks to install
function brew_cask_install() {
    list=("$@")
    installed=($(brew list --cask))

    for list_item in "${list[@]}"; do
        if [[ "${installed[@]}" =~ "$list_item" ]]; then
            echo "\"$list_item\" is already installed."
        else
            echo "Installing \"$list_item\"..."
            brew install --cask "$list_item"
            echo "Installed \"$list_item\"."
        fi
    done
}

# Cask List
declare homebrew_cask_list=(
    # Productivity
    "standard-notes"
    "obsidian"
    "firefox"
    "google-chrome"
    # "homebrew/cask-versions/google-chrome-dev"
    "microsoft-word"
    "microsoft-excel"
    "microsoft-powerpoint"
    "microsoft-onenote"
    "microsoft-outlook"
    "zotero"
    # Developer Tools
    "visual-studio-code"
    # "jetbrains-toolbox"
    # "teamviewer"
    # "virtualbox" # Incompatible with Apple Silicon
    "utm"
    # "vagrant"
    "docker"
    "drawio"
    # Security
    "cryptomator"
    "macfuse" # For Cryptomator File System Integration
    "keepassxc"
    # AI
    "ollama"
    # Entertainment
    "vlc"
    "spotify"
    # Social Media
    # "webex-meetings"
    "zoom"
    "microsoft-teams"
    "discord"
    "gotomeeting"
    # Other
    "ledger-live"
    # Fonts
    "font-jetbrains-mono"
    "font-fira-code"
)

brew_cask_install "${homebrew_cask_list[@]}"

echo "Installed Casks."
