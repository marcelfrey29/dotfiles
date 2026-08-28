# Dev Container

Core setup for Dev Containers.

## Base Image

Use a Debian-based base image when possible, e.g. `node:24.13-trixie` for Node.js.

```Dockerfile
FROM debian:13.3

# Set Locale
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"
```

## Core Packages and System Setup

```Dockerfile
# Install Core Packages and use "zsh" as default shells
RUN apt-get update && apt-get install -y \
    zsh \
    rsync \
    git \
    curl \
    vim \
    tree \
    htop \
    dnsutils
RUN chsh -s /bin/zsh
```

## Shared Command History

```Dockerfile
# Shared Command History (mount point)
RUN mkdir -p ~/.cmd-history
```

```jsonc
{
    "mounts": [
        // Command History Persistence & Sharing
        "source=${localEnv:HOME}${localEnv:USERPROFILE}/.cmd-history,target=/root/.cmd-history,type=bind",
    ],
}
```

## Dotfiles

```Dockerfile
# Setup Dotfiles in Container
RUN cd ~ && git clone https://github.com/marcelfrey29/dotfiles.git && cd dotfiles && ./install.sh
```

## Access to Ollama

```jsonc
{
    // Use Host Network to Access Ollama on Host Machine
    "runArgs": ["--net=host"],
}
```

## Default Extensions

```jsonc
{
    "customizations": {
        "zed": {
            "extensions": [],
        },
        "vscode": {
            "extensions": [
                // Markdown
                "bierner.github-markdown-preview",
                // Syntax Highlighting
                "redhat.vscode-xml",
                "redhat.vscode-yaml",
                // Other
                "gruntfuggly.todo-tree",
            ],
        },
    },
}
```

## Dependabot Updates

```yml
version: 2
updates:
    # Dev Container: Configuration Updates
    - package-ecosystem: "devcontainers"
      directory: "/"
      schedule:
          interval: weekly
      commit-message:
          prefix: "chore"
          prefix-development: "chore"
          include: "scope"
      labels:
          - "area: devcontainers"
          - "area: dependencies"

    # Dev Container: Docker Updates
    - package-ecosystem: "docker"
      directory: "/.devcontainer"
      schedule:
          interval: "weekly"
      commit-message:
          prefix: "chore"
          prefix-development: "chore"
          include: "scope"
      labels:
          - "area: dependencies"
          - "area: devcontainers"
```
