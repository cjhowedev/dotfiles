#!/usr/bin/env zsh

PROMPT='%~%# '

# use vi mode
bindkey -v

export EDITOR=nvim

alias ls='ls -A'
alias ll='ls -lhA'
alias vim=nvim
alias tmux='tmux new -As0'

eval "$(pyenv init -)"

eval "$(ssh-agent)" &> /dev/null

if [[ "$(uname -s)" == "Darwin" ]]; then
  ssh-add -K &> /dev/null
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
