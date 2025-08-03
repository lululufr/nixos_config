{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme        = "auto";
        globalstatus = { __raw = "vim.o.laststatus == 3" ; };
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
      
      extensions = [ "neo-tree" "lazy" "fzf" ];
    };
  };
};
}

