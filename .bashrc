#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=/usr/bin/vim

alias ls='ls --group-directories-first --color=auto -F'
alias ll='ls -l --group-directories-first --color=auto -F'
alias la='ls -la --group-directories-first --color=auto -F'
alias df='df -h'
alias fol='source ~/scripts/./follow.sh'


if [ -z "$(pidof i3)" ]; then
    export PS1="\[$(tput bold)\]\[\033[38;5;9m\][\[\033[38;5;227m\]\u\[\033[38;5;84m\]@\[\033[38;5;39m\]\h\[\033[38;5;213m\]\w \[\033[38;5;9m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
else    
    export PS1="\[$(tput bold)\]\[\e[31m\][\[\e[37m\]\u\[\e[32m\]@\[\e[36m\]\h\[\e[33m\]\w \[\e[31m\]]\[$(tput sgr0)\]\[\e[36m\]\\$ \[$(tput sgr0)\]"
fi
