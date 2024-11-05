#!/bin/bash

# Source: [Super+number key combos remapping in GNOME 40 (switch workspaces instead of launch docked apps)](https://unix.stackexchange.com/questions/677878/supernumber-key-combos-remapping-in-gnome-40-switch-workspaces-instead-of-laun)

for i in {1..9}; do 
  gsettings set "org.gnome.shell.keybindings" "switch-to-application-${i}" "[]"
  gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-${i}" "['<Super>${i}']"
  gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-${i}" "['<Super><Shift>${i}']"
  gsettings set "org.gnome.shell.extensions.dash-to-dock" "app-hotkey-${i}" "[]"
done

### Additional Steps
# 1. Open Gnome system extension 'Ubuntu Dock'
# 2. In 'Behaviour' Dock, uncheck 'Use keyboard shortcuts to activate apps'

