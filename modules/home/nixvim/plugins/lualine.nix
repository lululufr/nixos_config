{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        globalstatus = { __raw = "vim.o.laststatus == 3"; };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "encoding" "fileformat" "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      }; 
      extensions = [ "neo-tree" "lazy" "fzf" ];
    };
  };
}

