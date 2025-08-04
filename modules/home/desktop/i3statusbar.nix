{ config, pkgs, lib, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars.main = {
      blocks = [
        {
          block = "focused_window";
          max_width = 50;
          show_marks = "visible";
        }
        {
          block = "cpu";
          interval = 1;
          format = " $icon $utilization ";
          format_alt = " $icon $frequency ";
        }
        {
          block = "memory";
          format = " $icon $mem_used_percents ";
          format_alt = " $icon $mem_used/$mem_total ";
          interval = 5;
          warning_mem = 80.0;
          critical_mem = 95.0;
        }
        {
          block = "disk_space";
          path = "/";
          info_type = "available";
          format = " $icon $available ";
          format_alt = " $icon $used/$total ";
          warning = 20.0;
          alert = 10.0;
        }
        {
          block = "net";
          format = " $icon {$signal_strength $ssid |Wired} ";
          format_alt = " $icon $speed_down/$speed_up ";
          interval = 5;
        }
        {
          block = "sound";
          format = " $icon $volume ";
          headphones_indicator = true;
        }
        {
          block = "battery";
          interval = 10;
          format = " $icon $percentage ";
          full_format = " $icon ";
          empty_format = " $icon $percentage ";
          not_charging_format = " $icon $percentage ";
        }
        {
          block = "time";
          interval = 60;
          format = " $timestamp.datetime(f:'%a %d/%m %R') ";
        }
      ];
      settings = {
        theme = {
          theme = "modern";
          overrides = {
            idle_bg = "#2e3440";
            idle_fg = "#d8dee9";
          };
        };
      };
    };
  };
}
