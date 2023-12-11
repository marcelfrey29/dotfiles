#!/bin/zsh

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
declare vscode_extension_list=(
    # "redhat.ansible"
    # "vscjava.vscode-java-debug"
    "ms-azuretools.vscode-docker"
    "EditorConfig.EditorConfig"
    "dbaeumer.vscode-eslint"
    "tamasfe.even-better-toml"
    "GitHub.github-vscode-theme"
    # "golang.go"
    "hashicorp.terraform"
    "42Crunch.vscode-openapi"
    # "redhat.java"
    # "vscjava.vscode-maven"
    # "vscjava.vscode-java-dependency"
    # "ms-python.python"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode.remote-explorer"
    "rust-lang.rust-analyzer"
    # Required for Rust Debugging
    "ms-vscode.cpptools"
    # "vscjava.vscode-spring-boot-dashboard"
    # "Pivotal.vscode-spring-boot"
    # "vscjava.vscode-spring-initializr"
    # "miguelsolorio.symbols"
    # "vscjava.vscode-java-test"
    "Gruntfuggly.todo-tree"
    "vscodevim.vim"
    "Vue.volar"
    "redhat.vscode-xml"
    "redhat.vscode-yaml"
    "bierner.docs-view"
    "bierner.markdown-mermaid"
)

vscode_install_extensions "${vscode_extension_list[@]}"

echo "Installed Extensions."
