#!/usr/bin/env zsh

# Check lid state directly, no arguments needed
if grep -q open /proc/acpi/button/lid/LID/state; then
    echo "Lid is open. Enable laptop screen."
    hyprctl keyword monitor "eDP-1,preferred,auto,auto"
else
    # Lid is closed
    # If an external monitor is plugged in, just disable laptop screen
    echo "Lid is closed."
    if [[ "$(hyprctl monitors)" =~ "\sDP-[0-9]+" || "$(hyprctl monitors)" =~ "\sHDMI-\w-[0-9]+" ]]; then
        echo "External monitor present. Closed lid. Disabling laptop screen."
        hyprctl keyword monitor "eDP-1,disable"
        # Optional: reload Hyprland if needed
        # hyprctl reload
    else
        echo "No external monitor plugged in. Closed lid, suspending laptop."
        # hyprlock & disown && systemctl suspend
    fi
fi
