#!/usr/bin/env bash

echo "Copying VS Code User Config..."

rsync \
    -vrh \
    ./user-data/ ~/Library/Application\ Support/Code/User;

echo "Done."

echo "Installing VS Code Extensions..."

# Install VS Code Extensions
# $1: array<string> the list of extensions to install
function vscode_install_extensions() {
    list=("$@")
    installed=($(code --list-extensions))

    for list_item in "${list[@]}"; do
        if [[ "${installed[@]}" =~ "$list_item" ]]; then
            echo "\"$list_item\" is already installed."
        else
            echo "Installing \"${list_item}\"..."
            code --install-extension "$list_item"
            echo "Installed \"$list_item\"."
        fi
    done
}

# Extension List
# This list only includes extensions that need to be installed in the VC Code Client.
# Extensions required for all Dev Containers should be added to the
# "dev.containers.defaultExtensions" setting.
# Project-specific extensions should be added to the respective project.
declare vscode_extension_list=(
    # General 
    "github.github-vscode-theme"
    "miguelsolorio.symbols"
    "vscodevim.vim"
    "ms-vscode-remote.remote-containers"
    # Syntax Highlighting
    "redhat.vscode-xml"
    "redhat.vscode-yaml"
)

vscode_install_extensions "${vscode_extension_list[@]}"

echo "Installed Extensions."
