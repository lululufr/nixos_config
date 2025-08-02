{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = false;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
    };

    globals = {
      mapleader = " ";
    };

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      gitsigns.enable = true;
    };
  };
}
