
update:
    nix flake update

check:
    nix flake check

rebuild $host:
    sudo nixos-rebuild switch --flake .#{{host}} --impure

dry-run $host:
    sudo nixos-rebuild --dry-activate --flake .#{{host}} --impure

rollback $host:
    sudo nixos-rebuild --rollback switch .#{{host}} --impure

installer:
    nix-shell -p git wget neovim 
