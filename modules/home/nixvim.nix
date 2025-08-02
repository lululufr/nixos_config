# modules/home/nixvim.nix
{ pkgs, ... }:

{
 config = {

   programs.nixvim = {
     enable = true;

     globals = {
       mapleader      = " ";
       maplocalleader = " ";
     };

     extraConfigLuaPre = ''
       vim.opt.clipboard = "unnamedplus"
     '';

     plugins = {
       telescope.enable        = true;
       yanky.enable            = true;
       yanky.enableTelescope   = true;
       web-devicons.enable     = true;
       noice.enable            = true;
       treesitter.enable = true;
       neo-tree = {
         enable = true;
         window = { position = "left"; width = 30; };
         filesystem.followCurrentFile.enabled = true;
       };

       lualine = {
         enable = true;
         settings = {
           options = {
             theme = "auto";      
             icons_enabled = true;
           };

        };
       };

      zen-mode = {
         enable = true;
              };


     };

     keymaps = [
       ## yanky 
       { mode = "n"; key = "<leader>e";  action = "<cmd>Neotree toggle<CR>"; options.desc = "Toggle Neo-tree"; }
       { mode = "n"; key = "<leader>sy"; action = "<cmd>Telescope yank_history<CR>"; options.desc = "Yank history"; }
       { mode = "n"; key = "<leader>m";  action = "<cmd>Noice<CR>"; options.desc = "Noice messages"; }

       { mode = "n"; key = "<leader>e";  action = "<cmd>Neotree toggle<CR>"; options.desc = "Toggle Neo-tree"; }
     ];
   };
 };
}
