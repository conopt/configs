{ config, pkgs, ... }:

let
  lualine = pkgs.vimUtils.buildVimPlugin {
    name = "lualine";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "3cf45404d4ab5e3b5da283877f57b676cb78d41d";
      sha256 = "sha256-e0lnaUcwaZVhQfQMXL1HnO9Ds+Qh8She9DtVfsdpEMg";
    };
    buildPhase = ":";
  };
  nvim-tree = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-tree";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "3e49d9b7484e21f0b24ebdf21b8b7af227ea97a6";
      sha256 = "sha256-pqnpt7wccGF5u+V6qvva+vCLugoi+jJY7rk0lXTzg20";
    };
  };
  hop = pkgs.vimUtils.buildVimPlugin {
    name = "hop";
    src = pkgs.fetchFromGitHub {
      owner = "phaazon";
      repo = "hop.nvim";
      rev = "v2.0.2";
      sha256 = "sha256-rHoHSv5K/4Zb8friFtQGo562Avan2wmExm+SEztDF7k";
    };
  };
  telescope = pkgs.vimUtils.buildVimPlugin {
    name = "telescope";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "0.1.0";
      sha256 = "sha256-cRd0l4K+23eYADH3BCzliwwOY5iY/VFcZMvjUV+0lzc";
    };
    buildPhase = ":";
  };
  plenary = pkgs.vimUtils.buildVimPlugin {
    name = "plenary";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "4b66054e75356ac0b909bbfee9c682e703f535c2";
      sha256 = "sha256-qIfsQScKdwrVXUYry+RDjoMoKLuhlsw1GHOVoeOphfo=";
    };
    buildPhase = ":";
  };
  ruby = pkgs.ruby.withPackages (ps: with ps; [pry]);
in
{
  home.username = "Dolphin";
  home.homeDirectory = "/Users/Dolphin";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.git
    pkgs.htop
    ruby
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
      gst = "git status";
      gco = "git checkout";
      glo = "git log --oneline";
      ga = "git add";
      gc = "git commit";
      gcam = "git commit -a -m";
      gcan = "git commit -a --amend --no-edit";
      v = "nvim";
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
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      #{
      #  plugin = packer-nvim;
      #  type = "lua";
      #  config = ''
      #    require('packer').init()
      #    require('_init')
      #  '';
      #}
      plenary
      papercolor-theme
      hop
      telescope
      nvim-tree
      #feline-nvim
      lualine
      vim-nix
      #vim-airline
      #vim-airline-themes
    ];
    extraConfig = ''
      lua require('_init')
    '';
  };

  xdg.configFile."nvim/lua/_init.lua".source = ./init.lua;

  programs.git = {
    enable = true;
    userEmail = "yakumolx@gmail.com";
    userName = "Bare Bear";
    ignores = [ ".DS_Store" "*.tmp" ];
  };
}
