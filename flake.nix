{
    description = "nix-configurations";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
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
                        home-manager.users.anthony.imports = [
                            inputs.catppuccin.homeModules.catppuccin
                            ./home
                        ];
                    }
                    inputs.catppuccin.nixosModules.catppuccin
                    ./machines/milan
                ];
            };
            genoa = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.anthony.imports = [
                            inputs.catppuccin.homeModules.catppuccin
                            ./home
                        ];
                    }
                    inputs.catppuccin.nixosModules.catppuccin
                    ./machines/genoa
                ];
            };
            naples = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.anthony.imports = [
                            inputs.catppuccin.homeModules.catppuccin
                            ./home
                            ./machines/naples/dconf
                        ];
                    }
                    inputs.catppuccin.nixosModules.catppuccin
                    ./machines/naples
                    ./modules/desktops/gnome
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
                            ./home
                            ./modules/desktops/hyprland
                            ./machines/bari/home
                        ];
                    }
                    inputs.catppuccin.nixosModules.catppuccin
                    ./machines/bari
                ];
            };
        };
    };
}
