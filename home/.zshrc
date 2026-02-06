# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml

# Aliases
source ~/.aliases

# Add ~/.bin to PATH
export PATH=~/.bin:~/.bin/marcelfrey29:~/.local/bin:$PATH

# fzf
source <(fzf --zsh)

# Persist Command History (live sharing across terminal sessions)
HISTFILE=~/.cmd-history/.history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt appendhistory
