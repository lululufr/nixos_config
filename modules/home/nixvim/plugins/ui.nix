{

plugins.lazy = {
	enable = true;
};

plugins.nui = {
	enable = true;
};

  plugins.snacks = {
    enable = true;

    settings = {
      dashboard = {
        preset = {
          
	  header = ''


	 _       _       _          __      
	| |_   _| |_   _| |_   _   / _|_ __ 
	| | | | | | | | | | | | | | |_| '__|
	| | |_| | | |_| | | |_| |_|  _| |   
	|_|\__,_|_|\__,_|_|\__,_(_)_| |_|   

        
         '';
          keys = [
            { icon = " "; key = "f"; desc = "Find File";         action = ":lua Snacks.dashboard.pick('files')"; }
            { icon = " "; key = "n"; desc = "New File";          action = ":ene | startinsert"; }
            { icon = " "; key = "g"; desc = "Find Text";         action = ":lua Snacks.dashboard.pick('live_grep')"; }
            { icon = " "; key = "r"; desc = "Recent Files";      action = ":lua Snacks.dashboard.pick('oldfiles')"; }
            { icon = " "; key = "c"; desc = "Config";            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"; }
            { icon = " "; key = "s"; desc = "Restore Session";   section = "session"; }
            { icon = " "; key = "q"; desc = "Quit";             action = ":qa"; }
          ];
        };
      };

      indent       = { enabled = true;  };
      input        = { enabled = true;  };
      notifier     = { enabled = true;  };
      scope        = { enabled = true;  };
      scroll       = { enabled = true;  };
      statuscolumn = { enabled = false; };  # défini dans options.lua
      toggle       = { map = "LazyVim.safe_keymap_set"; };
      words        = { enabled = true;  };
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


