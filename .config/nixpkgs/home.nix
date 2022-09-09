{ config, pkgs, ... }:

let
  papercolor = pkgs.vimUtils.buildVimPlugin {
    name = "papercolor-theme";
    src = pkgs.fetchFromGitHub {
      owner = "NLKNguyen";
      repo = "papercolor-theme";
      rev = "1.0";
      sha256 = "";
    };
  };
in
{
  home.username = "Dolphin";
  home.homeDirectory = "/Users/Dolphin";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.git
    pkgs.htop
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;

    # enableSyntaxHighlighting = true;

    oh-my-zsh = {
      enable = true;
      theme = "bureau";
    };

    shellAliases = {
      recipe = "git --git-dir=$HOME/.recipe/ --work-tree=$HOME";
    };

    #plugins = [{
    #  # will source zsh-autosuggestions.plugin.zsh
    #  name = "zsh-autosuggestions";
    #  src = pkgs.fetchFromGitHub {
    #    owner = "zsh-users";
    #    repo = "zsh-syntax-highlighting";
    #    rev = "tags/0.7.1";
    #    sha256 = "gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
    #  };
    #}];
  };

  programs.fzf = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile ~/.config/nixpkgs/init.vim;
    plugins = with pkgs.vimPlugins; [
      papercolor-theme
      vim-nix
      vim-airline
      vim-airline-themes
    ];
  };

  programs.git = {
    enable = true;
    userEmail = "yakumolx@gmail.com";
    userName = "Bare Bear";
    ignores = [ ".DS_Store" "*.tmp" ];
  };
}
