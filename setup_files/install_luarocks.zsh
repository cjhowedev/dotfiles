#!/usr/bin/env zsh
set -e

local packages=(
  "luaformatter"
)

if command -v luarocks &>/dev/null; then
  local installed="$(luarocks list --porcelain)"
  function check_luarocks() {
    local q="^$1\s"
    local matched=$(echo "$installed" | grep -E "$q")
    ! [ -z "$matched" ] &>/dev/null
    return $?
  }

  function install_luarocks() {
    for package in "${@:1}"; do
      sudo luarocks install --server=https://luarocks.org/dev $package
    done
  }

  install_packages check_luarocks install_luarocks "${packages[@]}"
fi
