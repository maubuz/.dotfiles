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
	    - Switch to workspace on left: Super + h
	    - Switch to workspace on right: Super + l
	    - 

2. Transfer of ssh keys

3. Clone maubuz/ansible-homelab
    3.1 Install git and ansible
    3.2 Run ansible-pull on workstation playbook
        ansible-pull --ask-become-pass -U git@github.com:maubuz:q/ansible-homelab.git workstation.yml

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

