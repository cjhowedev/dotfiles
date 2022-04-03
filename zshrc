#!/usr/bin/env zsh

PROMPT='%~%# '

# use vi mode
bindkey -v

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.flutter/bin:$PATH"
export PATH="$HOME/Source/lua-language-server/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/Users/christianhowe/Source/lua-language-server/3rd/luamake/luamake
