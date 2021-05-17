#!/usr/bin/env zsh
set -e

local packages=(
  "prettier"
  "typescript"
  "typescript-language-server"
  "vim-language-server"
)

if command -v npm &>/dev/null; then
  local installed="$(npm list -g --depth=0 --parseable)"
  function check_npm() {
    local q="\/$1\$"
    local matched=$(echo "$installed" | grep -E "$q")
    ! [ -z "$matched" ] &>/dev/null
    return $?
  }

  function install_npm() {
    sudo npm install -g ${@:1}
  }

  install_packages check_npm install_npm "${packages[@]}"
fi

