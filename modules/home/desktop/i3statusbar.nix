{ config, pkgs, lib, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars.main = {
      blocks = [
        {
          block = "focused_window";
        }
        {
          block = "cpu";
          interval = 1;
          format = "🖥️ $utilization";
        }
        {
          block = "memory";
          format = "🧠 $mem_used_percents";
          interval = 5;
          warning_mem = 80.0;
          critical_mem = 95.0;
        }
        {
          block = "disk_space";
          path = "/";
          info_type = "available";
          format = "💾 $available";
          warning = 20.0;
          alert = 10.0;
        }
        {
          block = "net";
          format = "🌐 {$signal_strength $ssid |Wired}";
          interval = 5;
        }
        {
          block = "sound";
          format = "🔊 $volume";
          headphones_indicator = true;
        }
        {
          block = "battery";
          interval = 10;
          format = "🔋 $percentage";
        }
        {
          block = "time";
          interval = 60;
          format = "$timestamp.datetime(f:'%a %d/%m %R')";
        }
      ];
      settings = {
        theme = {
          theme = "modern";
        };
      };
    };
  };
}
