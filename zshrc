# Source my configs
for cfg in ~/.{aliases,exports,functions,antigen.zsh,extras}; do
   [[ -r "$cfg" ]] && source "$cfg"
done


# Antigen Stuffz
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen theme lambda

antigen apply
