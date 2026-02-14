# Dotfiles

> [!CAUTION]
> Installing the dotfiles will **override** some system configurations and certain files in your file system, for example in your home directory or your VS Code configuration.\
> **As with every script, make sure you understand the impact before executing it.**

> [!IMPORTANT]
> Currently all scripts only make sure that the packages that are defined in the list are installed.
> The package list **does not represent the target state** which means that installed packages that are no longer of the list are **not** removed.\
> If you want to remove a package that was removed from the list, uninstall it manually.  

## Tenets

- Support for macOS, Linux, and VS Code Dev Containers
    - Work seamlessly across different operating systems and projects
    - Dev Containers must work out of the box (_see security_)
- Security as job zero
    - Force and prefer Dev Containers: Don't install programming languages, runtimes, and tools on the main OS
        - Limit the impact of Supply Chain Attacks against OSS dependencies (e.g. malware, credential theft)
        - Limit the radius of AI Agents / Autonomuous Systems (e.g. prevent out-of-project files access, limit impact of prompt injections to project / dev container)
- Idempotency
    - It's possible to run the dotfiles installation scripts as often as needed

## Installation

To install the dotfiles, simply run the install script.

> [!NOTE]
> To install the dotfiles on your main OS, you must run the `./install.sh [--full-os]` script from outside the Dev Container.

```bash
# Terminal Config & Base Packages
./install.sh

# Full System and Application Configuration
./install.sh --full-os
```

VS Code Dev Containers support Dotfiles out of the box. 
Simply add the following configuration to your VS Code Settings.
With this settings applied, VS Code will automatically clone the dotfiles repository into the Dev Container and run the install script.

```json
{
    "dotfiles.repository": "https://github.com/marcelfrey29/dotfiles",
    "dotfiles.targetPath": "~/.dotfiles",
}
```

## Documentation: Features & Configuration

- [Acces Docker on Host from inside a Devcontainer](docs/docker-on-host-access.md)
- [Acces a remote Kubernetes Cluster](docs/remote-k8s-access.md)
- [Use Host SSH Keys and Config inside a Devcontainer](docs/share-ssh-keys-and-config.md)

## Requirements

- XCode Command Line Tools must be installed (`xcode-select --install`) 
- Git must be configured

## Post-Setup

- Docker
    - Configure file sharing: Allow Docker to mount the `~/.docker_volumes` directory

## Credits

I got inspiration from following repositories:

- https://github.com/holman/dotfiles 
- https://github.com/mathiasbynens/dotfiles 
- https://github.com/paulirish/dotfiles
