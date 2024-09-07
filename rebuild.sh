#!/usr/bin/env bash

source "$(pwd)/scripts/spinner.sh"

set -e

pushd ~/nixos/

if git diff --quiet '*.nix'; then
	echo "No changes detected, exiting."
	popd
	exit 0
fi

alejandra . &>/dev/null \
	|| (alejandra . ; echo "formatting failed!" && exit 1)

git diff -U0 '*.nix'

echo "NixOS Rebuilding..."

sudo nixos-rebuild switch &>nixos-switch.log && start_spinner 'NixOS Rebuilding...' || (cat nixos-switch.log | grep --color error && exit 1)

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

stop_spinner $?

popd

echo "NixOS Rebuild Successful!"
