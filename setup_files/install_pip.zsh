#!/usr/bin/env zsh
set -e

local packages=(
  "httpie"
  "cmake-language-server"
)

if command -v pip &>/dev/null; then
  local installed="$(pip list | tail -n +3)"
  function check_pip() {
    local q="^$1\s"
    local matched=$(echo "$installed" | grep -E "$q")
    ! [ -z "$matched" ] &>/dev/null
    return $?
  }

  function install_pip() {
    sudo pip install ${@:1}
  }

  install_packages check_pip install_pip "${packages[@]}"
fi
