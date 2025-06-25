{
    description = "nix-configurations";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        home-manager = {
           url = "github:nix-community/home-manager/release-25.05";
           inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprdock.url = "github:Xetibo/hyprdock";
    };

    outputs = { nixpkgs, ... }@ inputs: {
        nixosConfigurations = {
            milan = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = { inherit inputs; };
                    }
                    ./machines/milan
                ];
            };
            genoa = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = { inherit inputs; };
                    }
                    ./machines/genoa
                ];
            };
            naples = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = { inherit inputs; };
                    }
                    ./machines/naples
                ];
            };
            bari = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = { inherit inputs; };
                    }
                    ./machines/bari
                ];
            };
        };
    };
}
