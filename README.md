# Dotfiles

## Important Notes

- The scripts copy and **override** data in your home directory! Before running the scripts, make sure you understand what they are doing!
- You can run the installation scripts as often as you want, but only _additions_ are applied 
    - Currently, if packages are removed from the list in the script, they stay installed - even after running the install script - newly added packages are installed though

## Requirements

- XCode Command Line Tools must be installed (`xcode-select --install`) 
- Git must be configured

## Setup

- Run the `install.sh` script

## Post-Setup

- Docker
    - Configure file sharing: Allow Docker to mount the `~/.docker_volumes` directory

## Credits

I got inspiration from following repositories:

- https://github.com/holman/dotfiles 
- https://github.com/mathiasbynens/dotfiles 
- https://github.com/paulirish/dotfiles
