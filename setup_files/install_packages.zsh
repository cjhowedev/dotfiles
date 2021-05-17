#!/usr/bin/env zsh
set -e

function install_packages() {
  local check_cmd=$1
  local install_cmd=$2
  local packages=(${@:3})

  local should_install=false
  for package in ${packages[@]}; do
    if ! $check_cmd $package; then
      should_install=true
    fi
  done

  if $should_install; then
    $install_cmd "${packages[@]}"
  fi
}
