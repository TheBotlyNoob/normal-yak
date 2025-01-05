#!/bin/env bash

# install devenv
nix --extra-experimental-features "flakes nix-command" profile install --accept-flake-config nixpkgs#devenv
nix --extra-experimental-features "flakes nix-command" profile install --accept-flake-config nixpkgs#direnv

# install direnv configs to shell
# shellcheck disable=SC2016
echo 'eval "$(direnv hook bash)"' >>~/.bashrc
# shellcheck disable=SC2016
echo 'eval "$(direnv hook zsh)"' >>~/.zshrc
echo 'direnv hook fish | source' >>~/.config/fish/config.fish
