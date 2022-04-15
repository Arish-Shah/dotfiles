#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='nvim'
alias vim='nvim'
alias sudo='sudo '

PS1='\[\e[0;1;91m\][\[\e[0;1;93m\]\u\[\e[0;1;92m\]@\[\e[0;1;94m\]\h \[\e[0;1;95m\]\W\[\e[0;1;91m\]]\[\e[0m\]\$\[\e[0m\] '
