#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

ln -sf "$DIR/config/nvim" ~/.config
ln -sf "$DIR/local/share/nvim" ~/.local/share
