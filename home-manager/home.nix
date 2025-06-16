{ config, pkgs, lib, ... }: 

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
    imports = [ (import "${home-manager}/nixos") ];

    home-manager.users.anthony = { config, pkgs, ... }: {

	home.username = "anthony";
	home.homeDirectory = "/home/anthony";
	home.sessionVariables = {
	    EDITOR = "nvim";
	};

    home.packages = with pkgs; [ 
	  neovim
	  tmux
	  neofetch
	  ranger
	  wget
	  git
	  neofetch
	  zsh
      gh
      lazygit
	];

	programs.zsh = {
	    enable = true;
	    enableCompletion = true;
	    autosuggestion.enable = true;
	    syntaxHighlighting.enable = true;


	    oh-my-zsh = {
                enable = true;
		plugins = [ "git" ];
		theme = "";
	    };
	    shellAliases = {
	      update = "sudo nixos-rebuild switch";
	      edit = "nvim /etc/nixos/";
	    };

	    history = {
	        size = 10000;
		path = "${config.xdg.dataHome}/zsh/history";
	    };
    };

	programs.git = {
	    enable = true;
	    userName = "anthonymolinari";
	    userEmail = "amolinari017@gmail.com";
	};

	programs.gh = {
	   enable = true;
	   gitCredentialHelper = {
	       enable = true;
	   };
	};

    home.stateVersion = "25.05";
    };
}
