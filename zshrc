#!/usr/bin/env zsh

PROMPT='%~%# '

# use vi mode
bindkey -v

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls -A'
alias ll='ls -lA'

# fzf specific setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
