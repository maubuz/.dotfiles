# Notes on fresh install of Ubuntu

## Process

1. Gnome settings
 1.1 Ubuntu Desktop > Dock
  1.1.1 auto-hide the dock: ON
  1.1.2 Icon size > 36
 1.2 Keyboard > View and Customize Shortcuts
  1.2.1 Navigation
   - Switch Windows: Super + Tab
   - Switch applications: Alt + Tab
  1.2.2 Screenshot
   - Add shortcut for Flameshot (ensure it's installed)
   `script --command "flameshot gui" /dev/null`
    - See <https://github.com/flameshot-org/flameshot/issues/3365>
  1.2.3 Disable disable `Ctrl+Shift+U` (Unicode input)
   - Based on https://superuser.com/questions/358749/how-to-disable-ctrlshiftu
   - Go to Language Support on System Settings and change the Keyboard input method system to none
   - TODO: test cli way: `gsettings set org.freedesktop.ibus.panel.emoji unicode-hotkey "@as []"`

 1.3 Adjust native Gnome extensions
  1.3.1 Dash-to-dock

- Open Gnome Extentions Manager
- Select Ubuntu Dock > Select the "Behaviour" Panel
- Disable "Use keyboard shortcuts to activate apps"
- Alternatively, use the cli: `for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"; done`
  - Source: <https://github.com/micheleg/dash-to-dock/issues/914>

2. Transfer of ssh keys

3. Clone maubuz/ansible-homelab
    3.1 Install git and ansible
    3.2 Run ansible-pull on workstation playbook
        ansible-pull --ask-become-pass -U <git@github.com>:maubuz/ansible-homelab.git workstation.yml

4. Setup Syncthing node
    4.1 Login to localhost:8384
    4.2 Add central device & folders

5. Clone maubuz/.dotfiles
    5.1 Stow bash directory
    5.2 Install & prepare neovim kickstart
        - Clone neovim kickstart
        - Create mauvim directory and append require to nvim/init.lua
        - Stow .dotfiles/mauvim into nvim/lua/mauvim
6. Clone maubuz/mau-kmonad
    6.1 Follow instructions in repository (worked in Ubuntu 23.10)
