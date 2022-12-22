export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
export ZSH_THEME="robbyrussell"

export NVM_DIR="$XDG_DATA_HOME/nvm"
export VI_MODE_SET_CURSOR=true
export KEYTIMEOUT=1

plugins=(git nvm vi-mode)

source $ZSH/oh-my-zsh.sh

# aliases
alias ls="exa --icons --color=auto -lah --group-directories-first"
alias vc="cd $XDG_CONFIG_HOME/nvim && vi init.lua"

# shortcuts
bindkey -s "^f" "tmux_project^M"
