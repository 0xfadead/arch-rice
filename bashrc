# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# User can cd into vars
shopt -s cdable_vars

# Allow minor mispelling of directory names with 'cd'
shopt -s cdspell

# Bash includes filenames beginning with a '.' in the results of filename expansion
shopt -s dotglob

# Enable bash completion
[[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

# External config
if [[ -r ~/.dircolors ]] && type -p dircolors >/dev/null; then
  eval $(dircolors -b "$HOME/.dircolors")
fi

for cfg in ~/.{aliases,exports,functions,extras}; do
   [[ -r "$cfg" ]] && . "$cfg"
done
