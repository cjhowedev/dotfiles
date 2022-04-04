#!/usr/bin/env zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/Source/lua-language-server/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.flutter/bin:$HOME/go/bin:$PATH"

alias luamake=/Users/christianhowe/Source/lua-language-server/3rd/luamake/luamake
