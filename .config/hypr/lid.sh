#!/usr/bin/env zsh

if [[ "$(hyprctl monitors)" =~ "\sDP-[0-9]+" ]]; then
  if [[ $1 == "open" ]]; then
    echo "Opened lid. Enabled laptop screen."
    hyprctl keyword monitor "eDP-1,preferred,auto,auto"
  else
    hyprctl keyword monitor "eDP-1,disable"
    echo "Closed lid. Disabled laptop screen so workspace 1 doesn't stay on it."
  fi
fi
