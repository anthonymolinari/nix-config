{
    description = "python development env";
    inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    
    outputs = { self, nixpkgs }:
        let 
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            devShells.x86_64-linux.default = pkgs.mkShell {
                buildInputs = with pkgs; [
                    python310
                ];
                shellHook = ''
                    echo "started python devshell"
                '';
            };
        };
}
