#!/usr/bin/env bash
# Open application, wait two seconds, and move the application to another workspace.

EXEC_COMMAND=$1
INITIAL_CLASS=$2
WORKSPACE=$3


hyprctl dispatch exec "$EXEC_COMMAND"
sleep 2
hyprctl clients -j

# Get this to work with $INITIAL_CLASS
pid=$(hyprctl clients -j | jq -r ".[] | select(.initialClass | contains(\"$INITIAL_CLASS\")) | .pid")
echo $pid

hyprctl dispatch movetoworkspacesilent ${WORKSPACE},pid:${pid}
