#!/usr/bin/env zsh

PROMPT='%~%# '

export EDITOR='code -w'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

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

eval "$(pyenv init -)"

eval "$(ssh-agent)" &> /dev/null

if [[ "$(uname -s)" == "Darwin" ]]; then
  ssh-add -K &> /dev/null
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
