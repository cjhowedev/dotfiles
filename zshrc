#!/usr/bin/env zsh

PROMPT='%~%# '

export EDITOR=nano

alias ls='ls -A'
alias ll='ls -lhA'

eval "$(ssh-agent)" &> /dev/null

if [[ "$(uname -s)" == "Darwin" ]]; then
  ssh-add -K &> /dev/null
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
