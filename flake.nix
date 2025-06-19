{
    description = "nix-configurations";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        home-manager = {
           url = "github:nix-community/home-manager/release-25.05";
           inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, ... }: {
        nixosConfigurations = {
            milan = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./machines/milan
                ];
            };
            genoa = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./machines/genoa
                ];
            };
            naples = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./machines/naples
                ];
            };
            bari = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./machines/bari
                ];
            };
        };
    };
}
