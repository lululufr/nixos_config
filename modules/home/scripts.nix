{ config, pkgs, lib, ... }:

let
  powermenuScript = pkgs.writeScriptBin "powermenu" ''
    #!${pkgs.bash}/bin/bash
    # Power menu script using rofi with more options

    CHOSEN=$(printf "🔐 Lock\n💤 Suspend\n🔄 Logout\n🟠 Reboot\n🔴 Shutdown\n🖥️ Duplicate Screen\n🖥️ Extend Screen\n" | ${pkgs.rofi}/bin/rofi -dmenu -p "Power Menu")

    case "$CHOSEN" in
      "🔐 Lock") ${pkgs.i3lock}/bin/i3lock -c 000000 ;;
      "💤 Suspend") systemctl suspend ;;
      "🔄 Logout") i3-msg exit ;;
      "🟠 Reboot") systemctl reboot ;;
      "🔴 Shutdown") systemctl poweroff ;;
      "🖥️ Duplicate Screen") ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --auto --same-as eDP ;;
      "🖥️ Extend Screen") ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --auto --right-of eDP ;;
      *) exit 1 ;;
    esac
  '';

screenshotScript = pkgs.writeScriptBin "screenshot" ''
  #!${pkgs.bash}/bin/bash
  ${pkgs.maim}/bin/maim -g "$(${pkgs.xrectsel}/bin/xrectsel '%wx%h+%x+%y')" | ${pkgs.xclip}/bin/xclip -selection clipboard -i -t image/png && ${pkgs.libnotify}/bin/notify-send "Screenshot copied to clipboard"
'';



in
{
  home.packages = [
    powermenuScript
    screenshotScript
  ];
}
