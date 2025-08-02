{ config, pkgs, lib, ... }:

{
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;

      config = rec {
        modifier = "Mod4";
        terminal = "alacritty";
        menu = "rofi -show drun";

        fonts = {
          names = [ "JetBrainsMono Nerd Font" ];
          size = 10.0;
        };

        gaps = {
          inner = 2;
          outer = 1;
          smartGaps = true;
          smartBorders = "on";
        };

        window = {
          border = 2;
          titlebar = false;
          hideEdgeBorders = "smart";
        };

        floating = {
          border = 2;
          titlebar = false;
          criteria = [
            { class = "Pavucontrol"; }
            { class = "Nm-connection-editor"; }
            { class = "Arandr"; }
            { class = "feh"; }
            { class = "Matplotlib"; }
            { title = "File Transfer*"; }
            { title = "Picture-in-Picture"; }
          ];
        };

        keybindings = lib.mkOptionDefault {
          # Applications
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+o" = "exec firefox";
          "${modifier}+d" = "exec ${menu}";
          "${modifier}+r" = "exec rofi -show combi";
          "${modifier}+Shift+s" = "exec screenshot";
          "${modifier}+Shift+a" = "exec powermenu";

          # Multimédia
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set +10%";
          "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 10%-";

          # Screenshots
          "Print" = "exec --no-startup-id screenshot";
          "Shift+Print" = "exec --no-startup-id flameshot gui";

          # Navigation vim-like
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          # Redimensionnement
          "${modifier}+Ctrl+h" = "resize shrink width 10 px or 10 ppt";
          "${modifier}+Ctrl+j" = "resize grow height 10 px or 10 ppt";
          "${modifier}+Ctrl+k" = "resize shrink height 10 px or 10 ppt";
          "${modifier}+Ctrl+l" = "resize grow width 10 px or 10 ppt";

          # Modes
          "${modifier}+Shift+r" = "mode resize";
        };

        modes = {
          resize = {
            h = "resize shrink width 10 px or 10 ppt";
            j = "resize grow height 10 px or 10 ppt";
            k = "resize shrink height 10 px or 10 ppt";
            l = "resize grow width 10 px or 10 ppt";

            Left = "resize shrink width 10 px or 10 ppt";
            Down = "resize grow height 10 px or 10 ppt";
            Up = "resize shrink height 10 px or 10 ppt";
            Right = "resize grow width 10 px or 10 ppt";

            Escape = "mode default";
            Return = "mode default";
            "${modifier}+Shift+r" = "mode default";
          };
        };

        startup = [
          { command = "--no-startup-id xrandr --output DP-0 --rotate right --left-of DP-2"; always = true; notification = false; }
         { command = "--no-startup-id ${pkgs.feh}/bin/feh --bg-scale ${config.stylix.image}"; always = true; notification = false; }
          { command = "--no-startup-id picom"; always = false; notification = false; }
          { command = "--no-startup-id dunst"; always = false; notification = false; }
          { command = "--no-startup-id nm-applet"; always = false; notification = false; }
          { command = "--no-startup-id blueman-applet"; always = false; notification = false; }
        ];

        bars = [{
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
        }];
      };

      extraConfig = ''
        # Configuration supplémentaire i3
        for_window [class="^.*"] border pixel 2
        for_window [class="Spotify"] move to workspace 10
        for_window [urgent=latest] focus

        # Assignations de workspaces
        assign [class="Firefox"] → 2
        assign [class="Code"] → 3
        assign [class="discord"] → 9
        assign [class="Spotify"] → 10

        # Focus follows mouse
        focus_follows_mouse yes

        # Popup during fullscreen mode
        popup_during_fullscreen smart

        # Back and forth workspace
        workspace_auto_back_and_forth yes

        # Workspace names
        set $ws1 "1:  Terminal"
        set $ws2 "2:  Web"
        set $ws3 "3:  Code"
        set $ws4 "4:  Files"
        set $ws5 "5:  Docs"
        set $ws6 "6:  Media"
        set $ws7 "7:  Games"
        set $ws8 "8:  VM"
        set $ws9 "9:  Chat"
        set $ws10 "10:  Music"
      '';
    };
  };
}
