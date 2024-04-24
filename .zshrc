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
alias ls="ls -lah --color=auto --group-directories-first"
alias vi="nvim.appimage"
alias vc="cd $XDG_CONFIG_HOME/nvim && vi init.lua"
alias up="sudo apt update; sudo apt upgrade"

# shortcuts
bindkey -s "^f" "tmux_sessionizer^M"
