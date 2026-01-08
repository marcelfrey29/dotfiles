# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml

# Aliases
source ~/.aliases

# Add ~/.bin to PATH
export PATH=~/.bin:~/.bin/private:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH" # libpg (Not automatically symlined by Homebrew due to conflict with postgres) 

# Make compilers (e.g. rustc) find libpg
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export PQ_LIB_DIR="/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
