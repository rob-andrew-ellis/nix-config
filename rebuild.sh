#!/usr/bin/env bash

set -e

$EDITOR configuration.nix

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

sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"

popd

notify-send -e "NixOS Rebuild Successful!" --icon=software-update-available
