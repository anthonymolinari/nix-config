{ pkgs, ... }: {
    # neovim & language servers for vim-lspconfig
    home.packages = with pkgs; [
        neovim
        nixd
        bash-language-server
        lua-language-server
        javascript-typescript-langserver
        pyright
        gopls
    ];
}
