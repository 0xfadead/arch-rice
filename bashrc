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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

# External config
if [[ -r ~/.dircolors ]] && type -p dircolors >/dev/null; then
  eval $(dircolors -b "$HOME/.dircolors")
fi

for cfg in ~/.{aliases,exports,functions,git-prompt}; do
   [[ -r "$cfg" ]] && . "$cfg"
done
