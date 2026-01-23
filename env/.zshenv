unsetopt GLOBAL_RCS

# xdg base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# system env
export EDITOR="vim"

export BUN_INSTALL="$XDG_DATA_HOME/bun"

# construct path
typeset -U path PATH
path=($HOME/.local/bin $BUN_INSTALL/bin $path)
export PATH
