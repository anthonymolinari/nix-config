{
    description = "dotnet web development env";
    inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    
    outputs = { self, nixpkgs }:
        let 
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            devShells.x86_64-linux.default = pkgs.mkShell {
                buildInputs = with pkgs; [
                    dotnetCorePackges.sdk_9_0_3xx
                    nodejs_24
                ];
                shellHook = ''
                    echo "started dotnet devshell"
                '';
            };
        };
}
