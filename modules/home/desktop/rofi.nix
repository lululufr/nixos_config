{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,run,window,combi,ssh,keys,filebrowser";
      combi-modi = "drun,run,window";

      show-icons = true;
      icon-theme = "Papirus";
      terminal = "alacritty";

      drun-display-format = "{icon} {name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      window-format = "{w} · {c} · {t}";

      location = 0;
      #width = 50;
      lines = 6;
      columns = 1;

      disable-history = false;
      hide-scrollbar = false;
      sidebar-mode = true;
      case-sensitive = false;
      cycle = true;
      auto-select = false;
      parse-hosts = true;
      parse-known-hosts = true;


      drun-icon-size = 48;  
      window-icon-size = 48; 
      eh = 3;

      padding = 25;

      scrollbar-width = 4;

      matching = "fuzzy";
      sort = true;
      sorting-method = "fzf";

      lazy-grab = true;

      display-window = " 﩯 Windows";
      display-windowcd = " Windows";
      display-run = "  Run";
      display-ssh = "  SSH";
      display-drun = "  Apps";
      display-combi = "  All";
      display-keys = "  Keys";
      display-filebrowser = "  Files";

      click-to-exit = true;
      steal-focus = true;

      kb-row-up = "Up,Control+k,Shift+Tab,Shift+ISO_Left_Tab";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-remove-to-eol = "Control+Shift+e";
      kb-mode-next = "Shift+Right,Control+Tab";
      kb-mode-previous = "Shift+Left,Control+Shift+Tab";
      kb-toggle-case-sensitivity = "grave,dead_grave";

      ssh-client = "ssh";
      ssh-command = "{terminal} -e {ssh-client} {host} [-p {port}]";

      run-command = "{cmd}";
      run-list-command = "";
      run-shell-command = "{terminal} -e {cmd}";
    };

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
  };
}
