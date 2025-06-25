
update:
    nix flake update

check:
    nix flake check

rebuild $host:
    sudo nixos-rebuild switch --flake .#{{host}} 

dry-run $host:
    sudo nixos-rebuild --dry-activate --flake .#{{host}}

rollback $host:
    sudo nixos-rebuild --rollback switch .#{{host}}

installer:
    nix-shell -p git wget neovim 
