#!/usr/bin/env zsh

PROMPT='%~%# '

export EDITOR="code -w"
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls -A'
alias ll='ls -lhA'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
