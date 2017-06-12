#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

export PS1="\[$(tput bold)\]\[\033[38;5;9m\][\[\033[38;5;227m\]\u\[\033[38;5;84m\]@\[\033[38;5;39m\]\h\[\033[38;5;213m\]\w \[\033[38;5;9m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
