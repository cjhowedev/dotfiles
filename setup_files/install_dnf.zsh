#!/usr/bin/env zsh
set -e

local packages=(
  "binutils"
  "gcc"
  "gcc-c++"
  "clang"
  "clang-tools-extra"
  "cmake"
  "lldb"
  "luarocks"
  "lua-devel"
  "luajit-devel"
  "fzf"
  "make"
  "ninja-build"
  "git"
  "ripgrep"
  "nodejs"
)

if command -v dnf &>/dev/null; then
  local installed="$(dnf list --installed)"
  function check_dnf() {
    local q="^$(echo "$1" | sed 's/+/\\+/g')\."
    local matched=$(echo "$installed" | grep -E "$q")
    ! [ -z "$matched" ] &>/dev/null
    return $?
  }

  function install_dnf() {
    sudo dnf install -y ${@:1}
  }

  install_packages check_dnf install_dnf "${packages[@]}"
fi
