unsetopt GLOBAL_RCS

# xdg base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export BUN_INSTALL="$XDG_DATA_HOME/bun"

export EDITOR="vim"

typeset -U path PATH
path=($HOME/.local/bin $BUN_INSTALL/bin $path)
export PATH
