#!/bin/zsh

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
declare vscode_extension_list=(
    # "redhat.ansible"
    # "vscjava.vscode-java-debug"
    "ms-azuretools.vscode-docker"
    "EditorConfig.EditorConfig"
    "dbaeumer.vscode-eslint"
    "GitHub.github-vscode-theme"
    # "golang.go"
    "hashicorp.terraform"
    # "redhat.java"
    # "vscjava.vscode-maven"
    # "vscjava.vscode-java-dependency"
    # "ms-python.python"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode.remote-explorer"
    "rust-lang.rust-analyzer"
    # "vscjava.vscode-spring-boot-dashboard"
    # "Pivotal.vscode-spring-boot"
    # "vscjava.vscode-spring-initializr"
    # "miguelsolorio.symbols"
    # "vscjava.vscode-java-test"
    "vscodevim.vim"
    "Vue.volar"
    "redhat.vscode-xml"
    "redhat.vscode-yaml"
)

vscode_install_extensions "${vscode_extension_list[@]}"

echo "Installed Extensions."
