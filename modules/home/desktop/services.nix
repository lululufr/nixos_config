{ config, pkgs, ... }:

{
  services = {
    # Dunst
    dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          frame_width = 3;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          notification_limit = 5;
          idle_threshold = 120;
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action";
          mouse_right_click = "close_all";
        };

        urgency_low = {
          timeout = 10;
        };

        urgency_normal = {
          timeout = 10;
        };

        urgency_critical = {
          timeout = 0;
        };
      };
    };

    # Picom
    picom = {
      enable = true;
      backend = "glx";
      vSync = true;

      fade = true;
      fadeDelta = 5;
      fadeSteps = [ 0.03 0.03 ];

      shadow = true;
      shadowOffsets = [ (-7) (-7) ];
      shadowOpacity = 0.7;
      shadowExclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      settings = {
	refresh-rate = 144;
        blur = {
          method = "dual_kawase";
          strength = 6;
          background = false;
          background-frame = false;
          background-fixed = false;
        };

        corner-radius = 12;
        rounded-corners-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
        ];

        mark-wmwin-focused = true;
        mark-ovredir-focused = true;
        detect-rounded-corners = true;
        detect-client-opacity = true;
        detect-transient = true;
      };
    };

  };
}
