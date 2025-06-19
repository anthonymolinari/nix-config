{
    description = "nix-configurations";

    inputs = {
        #flake-utils.url = "github:numtide/flake-utils";
        #nixpkgs.url = "github:nixos/nixos-25.05";
        #home-manager = {
        #   url = "github:nix-community/home-manager/release-25.05";
        #   inputs.nixpkgs.follows = "nixpkgs";
        #};
    };

    outputs = { ... }: {
        nixosConfigurations = {
            milan = {
                modules = [
                    ./machines/milan
                ];
            };
            genoa = {
                modules = [
                    ./machines/genoa
                ];
            };
            naples = {
                modules = [
                    ./machines/naples
                ];
            };
            bari = {
                modules = [
                    ./machines/bari
                ];
            };
        };
    };
}
