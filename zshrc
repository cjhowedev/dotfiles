#!/usr/bin/env zsh

PROMPT='%~%# '

# use vi mode
bindkey -v

export EDITOR=nvim

alias ls='ls -A'
alias ll='ls -lhA'
alias vim=nvim

eval "$(pyenv init -)"

eval "$(ssh-agent)" &> /dev/null

if [[ "$(uname -s)" == "Darwin" ]]; then
  ssh-add -K &> /dev/null
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
