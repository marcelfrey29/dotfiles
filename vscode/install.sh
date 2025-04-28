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
    # General 
    "vscodevim.vim"
    "GitHub.github-vscode-theme"
    "miguelsolorio.symbols"
    "Gruntfuggly.todo-tree"
    "EditorConfig.EditorConfig"
    # JavaScript / TypeScript
    # "Vue.volar"
    "biomejs.biome"
    "bradlc.vscode-tailwindcss"
    # Go
    "golang.go"
    # Rust
    # "rust-lang.rust-analyzer"
    # "tamasfe.even-better-toml"
    # Required for Rust Debugging
    # "ms-vscode.cpptools"
    # Java
    # "redhat.java"
    # "mathiasfrohlich.kotlin"
    # "vscjava.vscode-maven"
    # "vscjava.vscode-gradle"
    # "vscjava.vscode-java-test"
    # "vscjava.vscode-java-debug"
    # "vscjava.vscode-java-dependency"
    # "Pivotal.vscode-spring-boot"
    # "vscjava.vscode-spring-boot-dashboard"
    # "vscjava.vscode-spring-initializr"
    # Python
    # "ms-python.python"
    # AWS
    "amazonwebservices.aws-toolkit-vscode"
    "sebastianbille.iam-legend"
    # Infrastructure as Code
    "redhat.ansible"
    "hashicorp.terraform"
    # Docker & K8s
    "ms-azuretools.vscode-docker"
    "ms-kubernetes-tools.vscode-kubernetes-tools"
    # APIs
    "42Crunch.vscode-openapi"
    # CI
    "github.vscode-github-actions"
    # Markdown
    "bierner.markdown-mermaid"
    "bierner.markdown-emoji"
    "bierner.markdown-checkbox"
    "bierner.markdown-yaml-preamble"
    "bierner.markdown-footnotes"
    # AI
    "github.copilot"
    "Continue.continue"
    # Other
    "redhat.vscode-xml"
    "redhat.vscode-yaml"
    "connor4312.esbuild-problem-matchers" # Required for VS Code Extension Development with esbuild
)

vscode_install_extensions "${vscode_extension_list[@]}"

echo "Installed Extensions."
