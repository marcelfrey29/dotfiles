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
    # Productivity
    "pandoc"
    # Developer Tools
    "helm"
    "awscli"
    "gh"
    "cfn-lint" # AWS CloudFormation Linter
    "act" # Run GitHub Actions locally
    "starship"
    "fzf" # Command-line fuzzy finder
    # "nano"
    "wget"
    "jq"
    "yq"
    "bruno"
    "ansible"
    "ansible-lint"
    "kube-linter" # K8s Linter
    "terraform"
    "argocd"
    "trivy"
    # "gradle"
    # "maven"
    "bearer/tap/bearer"
    # Programming Languages
    "bun"
    "go"
    # "go@1.16"
    # "node" # Node.js is installed via Node Version Manager (nvm)
    # "openjdk"
    # "openjdk@8"
    # "openjdk@11"
    "openjdk@21"
    # "rust" # Rust is installed via Rustup
    "cocoapods" # Required for Tauri iOS Projects
    # "python@3.9"
    # Packages / Libraries
    "libpq" # Required for diesel.rs (Postgres C API Library)
)

brew_formulas_install "${homebrew_formulae_list[@]}"

echo "Installed Formulas."
