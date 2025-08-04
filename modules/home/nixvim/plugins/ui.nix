{

plugins.lazy = {
	enable = true;
};

plugins.nui = {
	enable = true;
};


plugins.dashboard = {
  enable = true;
  settings = {
    theme = "hyper";
    config = {
      header = [
        " *       *       *          *_      "
        "| |_   *| |*   *| |*   *   / *|_ __ "
        "| | | | | | | | | | | | | | |_| '__|"
        "| | |_| | | |_| | | |_| |_|  _| |   "
        "|_|\\__,_|_|\\__,_|_|\\__,_(_)_| |_|   "
        ""
      ];
      shortcut = [
        {
          desc = " Find File";
          group = "@property";
          action = "Telescope find_files";
          key = "f";
        }
        {
          desc = " New File";
          group = "Label";
          action = "enew";
          key = "n";
        }
        {
          desc = " Find Text";
          group = "DiagnosticHint";
          action = "Telescope live_grep";
          key = "g";
        }
        {
          desc = " Recent Files";
          group = "Number";
          action = "Telescope oldfiles";
          key = "r";
        }
        {
          desc = " Quit";
          group = "Action";
          action = "quit";
          key = "q";
        }
      ];
    };
  };
};
        
 


  plugins.mini = {
    enable = true;
    modules = {
      icons = {
        file = {
          ".keep"             = { glyph = "󰊢"; hl = "MiniIconsGrey"; };
          "devcontainer.json" = { glyph = ""; hl = "MiniIconsAzure"; };
        };
        filetype = {
          dotenv = { glyph = ""; hl = "MiniIconsYellow"; };
        };
      };
    };

    mockDevIcons = true; # remplace nvim-web-devicons automatiquement
  };


  plugins.noice = {
    enable = true;

    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown"                = true;
          "cmp.entry.get_documentation"                  = true;
        };
      };

      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d+L, %d+B";       }  # ex. “5L, 100B”
              { find = "; after #%d+";     }  # “; after #42”
              { find = "; before #%d+";    }  # “; before #7”
            ];
          };
          view = "mini";    # rendu compact
        }
      ];

      presets = {
        bottom_search          = true;
        command_palette        = true;
        long_message_to_split  = true;
      };
    };
  };

  plugins.notify.enable = true;




}


