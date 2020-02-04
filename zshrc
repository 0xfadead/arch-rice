# Source my configs
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

for cfg in ~/.{aliases,exports,functions,antigen.zsh,extras}; do
   [[ -r "$cfg" ]] && source "$cfg"
done

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

gpg-connect-agent updatestartuptty /bye

# Antigen Stuffz
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen theme ys

antigen apply
source ~/.exports
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/nvm/init-nvm.sh
