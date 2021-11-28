#!/usr/bin/env zsh

PROMPT='%~%# '

export EDITOR='code --wait'
export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

alias ls='ls -A'
alias ll='ls -lhA'

eval "$(pyenv init -)"

eval "$(ssh-agent)" &> /dev/null

if [[ "$(uname -s)" == "Darwin" ]]; then
  ssh-add -K &> /dev/null
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.cargo/env ] && source ~/.cargo/env

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
