export ZSH="$HOME/.local/share/oh-my-zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
export ZSH_THEME="robbyrussell"

export NVM_DIR="$XDG_DATA_HOME/nvm"

plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="ls --color=auto -lah --group-directories-first"
