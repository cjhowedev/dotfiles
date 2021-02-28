#!/usr/bin/env zsh

PROMPT='%~%# '

export EDITOR=nano
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH"

alias ls='ls -A'
alias ll='ls -lhA'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
load-nvmrc() {
  command -v nvm &> /dev/null
  if [ $? -eq 0 ]; then
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    elif [[ $(nvm version) != $(nvm version default)  ]]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(ssh-agent)" &> /dev/null

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
