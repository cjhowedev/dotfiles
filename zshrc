#!/usr/bin/env zsh

PROMPT='%~%# '

# use vi mode
bindkey -v

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"

alias ls='ls -A'
alias ll='ls -lhA'
alias vim=nvim
alias e=nvim

# fzf specific setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

eval "$(ssh-agent)"
