{

    inputs = {
        flake-utils.url = "github:numtide/flake-utils";
        nixpkgs.url = "github:nixos/nixos-25.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { flake-utils, nixpkgs, ... }@inputs: {
    

    };
}
