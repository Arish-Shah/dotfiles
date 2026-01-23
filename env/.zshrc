[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

HISTFILE="$XDG_STATE_HOME/zsh/history"
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

export ZSH="$XDG_DATA_HOME/oh-my-zsh"

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
VI_MODE_SET_CURSOR=true
KEYTIMEOUT=5
ZSH_TMUX_AUTOSTART=true
plugins=(bun git tmux vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey -s "^f" "sessionizer^M"
