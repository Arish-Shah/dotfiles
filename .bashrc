#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto --group-directories-first'
alias vi='nvim'
alias vim='nvim'
alias sudo='sudo '
alias lf='lf-ueberzug'
alias p='sudo pacman'

PS1='\[\e[0;1;91m\][\[\e[0;1;93m\]\u\[\e[0;1;92m\]@\[\e[0;1;94m\]\h \[\e[0;1;95m\]\W\[\e[0;1;91m\]]\[\e[0m\]\$\[\e[0m\] '
# PS1='[\u@\h \W]\$ '

# Change title of terminals
case ${TERM} in
  st-*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

set -o vi
