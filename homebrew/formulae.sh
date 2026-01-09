#!/bin/zsh

echo "Installing Homebrew Formulas..."

brew tap oven-sh/bun

# Install packages via homebrew
# $1: array<string> the list of fomulas to install
function brew_formulas_install() {
    list=("$@")
    installed=($(brew list --formulae))

    for list_item in "${list[@]}"; do
        if [[ "${installed[@]}" =~ "$list_item" ]]; then
            echo "\"$list_item\" is already installed."
        else
            echo "Installing \"$list_item\"..."
            brew install "$list_item"
            echo "Installed \"$list_item\"."
        fi
    done
}

# Cask List
declare homebrew_formulae_list=(
    # Terminal
    "starship"
    "fzf"
    # Core Utils
    "wget"
    # "nano"
    # Productivity
    # "pandoc"
    # Developer Tools
    "jq"
    "yq"
    "bruno"
)

brew_formulas_install "${homebrew_formulae_list[@]}"

echo "Installed Formulas."
