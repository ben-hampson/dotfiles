#!/usr/bin/env zsh

if [[ "$(hyprctl monitors)" =~ "\sDP-[0-9]+" || "$(hyprctl monitors)" =~ "\sHDMI-\w-[0-9]+" ]]; then
  echo "External monitor plugged in."

  if [[ $1 == "open" ]]; then
    echo "Opened lid. Enabled laptop screen."
    hyprctl keyword monitor "eDP-1,preferred,auto,auto"
  else
    echo "External monitor present. Closed lid. Disabling laptop screen so workspace 1 doesn't stay on it."
    hyprctl keyword monitor "eDP-1,disable"
  fi
else
  echo "No external monitor plugged in. Closed lid, suspending laptop."
  hyprlock & disown && systemctl suspend
fi
