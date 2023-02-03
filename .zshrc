# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml

# Aliases
source ~/.aliases

# Add ~/.bin to PATH
export PATH=~/.bin:~/.bin/private:$PATH
