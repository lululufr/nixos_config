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
          pick = ''
            function(cmd, opts)
              return LazyVim.pick(cmd, opts)()
            end
          '';
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
            { icon = " "; key = "x"; desc = "Lazy Extras";       action = ":LazyExtras"; }
            { icon = "󰒲 "; key = "l"; desc = "Lazy";             action = ":Lazy"; }
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
}


