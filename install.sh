#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

function link_folder() {
  rm -rf "$HOME/.$1"
  mkdir -p "$HOME/.$(dirname "$1")"
  ln -sf "$DIR/$1" "$HOME/.$(dirname "$1")"
}

function link_file() {
  ln -sf "$DIR/$1" "$HOME/.$1"
}

link_folder config/nvim
link_folder local/share/nvim

link_file zshrc
link_file gitignore
link_file tmux.conf
link_file tmuxline.conf
