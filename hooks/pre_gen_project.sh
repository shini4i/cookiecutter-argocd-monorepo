#!/usr/bin/env bash

dependencies=(direnv pre-commit tfswitch transcrypt kubectl pwgen terraform yq)

check_if_binary_exists() {
  if ! which "$1" > /dev/null; then
    echo "Error $1 not found in path"
    exit 1
  fi

  if [ ! -x "$(which "$1")" ]; then
    echo "Error: $1 is not executable"
    exit 1
  fi
}

main() {
  for dependency in "${dependencies[@]}"; do
    check_if_binary_exists "$dependency"
  done
}

main
