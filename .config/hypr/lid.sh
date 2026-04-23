#!/usr/bin/env zsh

set -eu

lid_state_file=/proc/acpi/button/lid/LID/state
log_file=/home/ben/log/lid.log
internal_monitor=eDP-1
external_monitor=DP-6

mkdir -p /home/ben/log

log() {
    print -r -- "$(date '+%F %T') $*" >> "$log_file"
}

move_workspaces() {
    hyprctl -j workspaces \
        | jq -r --arg monitor "$1" '.[] | select(.monitor == $monitor) | .name' \
        | while IFS= read -r workspace; do
            [[ -n "$workspace" ]] || continue
            log "move workspace $workspace -> $2"
            hyprctl dispatch moveworkspacetomonitor "$workspace $2"
        done
}

if grep -q open "$lid_state_file"; then
    log "lid open -> dpms on $internal_monitor"
    hyprctl dispatch dpms on "$internal_monitor"
else
    # Keep the session running on external displays, otherwise suspend.
    if hyprctl monitors | grep -Eq '^Monitor (DP-|HDMI-|DVI-|VGA-)'; then
        move_workspaces "$internal_monitor" "$external_monitor"
        log "lid closed with external monitor -> dpms off $internal_monitor"
        hyprctl dispatch dpms off "$internal_monitor"
    else
        log "lid closed without external monitor -> suspend"
        systemctl suspend
    fi
fi
