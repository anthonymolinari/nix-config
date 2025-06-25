#!/bin/bash

# path to dev shells
dev_shells="/etc/nixos/dev-shells"

# copy the dev shell flake to working directory
workdir=$(pwd)

echo "copying $1 dev shell to $workdir..."

case $1 in 
    dotnet)
        cp "$dev_shells/dotnet-shell.nix" "$workdir/flake.nix"
        ;;
    python)
        cp "$dev_shells/python-shell.nix" "$workdir/flake.nix"
        ;;
    node)
        cp "$dev_shells/node-shell.nix" "$workdir/flake.nix"
        ;;
    go)
        cp "$dev_shells/go-shell.nix" "$workdir/flake.nix"
        ;;
    dart)
        cp "$dev_shells/dart-shell.nix" "$workdir/flake.nix"
        ;;
esac

echo "..done"
