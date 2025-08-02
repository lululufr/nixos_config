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
      "🖥️ Duplicate Screen") ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-0 --mode 1920x1080 --same-as eDP ;;
      "🖥️ Extend Screen") ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-0 --auto --right-of eDP ;;
      *) exit 1 ;;
    esac
  '';

  screenshotScript = pkgs.writeScriptBin "screenshot" ''
    #!${pkgs.bash}/bin/bash
    # Screenshot script with multiple options

    CHOSEN=$(printf "🖼️ Full Screen\n📐 Select Area\n🪟 Current Window\n📋 To Clipboard\n" | ${pkgs.rofi}/bin/rofi -dmenu -p "Screenshot")

    DATE=$(date +%Y-%m-%d_%H-%M-%S)
    DIR="$HOME/Pictures/Screenshots"
    mkdir -p "$DIR"

    case "$CHOSEN" in
      "🖼️ Full Screen") ${pkgs.maim}/bin/maim "$DIR/screenshot_$DATE.png" && notify-send "Screenshot saved" ;;
      "📐 Select Area") ${pkgs.maim}/bin/maim -s "$DIR/screenshot_$DATE.png" && notify-send "Screenshot saved" ;;
      "🪟 Current Window") ${pkgs.maim}/bin/maim -i $(${pkgs.xdotool}/bin/xdotool getactivewindow) "$DIR/screenshot_$DATE.png" && notify-send "Screenshot saved" ;;
      "📋 To Clipboard") ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png && notify-send "Screenshot copied to clipboard" ;;
      *) exit 1 ;;
    esac
  '';
in
{
  home.packages = [
    powermenuScript
    screenshotScript
  ];
}
