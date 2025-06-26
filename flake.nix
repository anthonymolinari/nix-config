{
    description = "nix-configurations";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        stylix = {
            url = "github:nix-community/stylix/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
           url = "github:nix-community/home-manager/release-25.05";
           inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprdock.url = "github:Xetibo/hyprdock";
        catppuccin.url = "github:catppuccin/nix";
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
                    inputs.stylix.nixosModules.stylix
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
                    inputs.stylix.nixosModules.stylix
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
                        home-manager.users.anthony.imports = [
                            inputs.catppuccin.homeModules.catppuccin
                        ];
                    }
                    inputs.catppuccin.nixosModules.catppuccin
                    ./machines/bari
                ];
            };
        };
    };
}
