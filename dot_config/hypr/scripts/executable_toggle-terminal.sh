#!/usr/bin/env bash
#
# toggle-terminal.sh
# to work in hypr with `exec`, you must put a symbolic link into a folder on the PATH, like `~/.local/bin`

SPECIAL=$(hyprctl clients -j | jq -r '.[] | select(.workspace.name == "special:terminal") | .address')
VISIBLE=$(hyprctl monitors -j | jq -r '.[] | select(.specialWorkspace.name == "special:terminal") | .id')


echo "[toggle-terminal]: SPECIAL - '$SPECIAL' " | systemd-cat -p info -t toggle-terminal
echo "[toggle-terminal]: VISIBLE - '$VISIBLE' " | systemd-cat -p info -t toggle-terminal


if [[ -z "$SPECIAL" ]]; then
    # No terminal yet, on-created-empty handles launching
    hyprctl dispatch togglespecialworkspace terminal
elif [[ -n "$VISIBLE" ]]; then
    # Visible, hide it
    hyprctl dispatch togglespecialworkspace terminal
else
    # Exists but hidden, show it then always resize to current monitor
    hyprctl dispatch togglespecialworkspace terminal
    # sleep 0.1
    hyprctl --batch \
      "dispatch focuswindow class:special-term; \
      dispatch resizeactive exact 70% 55%; \
      dispatch centerwindow"
fi
