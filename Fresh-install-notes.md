# Notes on fresh install of Ubuntu

## Process

1. Create and add new ssh keys to Github
    1. Generate new ssh key
    2. Login to GitHub using Yubikey

2. Clone maubuz/ansible-homelab
    1. Follow bootstrap procedure to install git and ansible
    2. Run ansible-pull on workstation playbook
        ansible-pull --ask-become-pass -U git@github.com:maubuz:q/ansible-homelab.git workstation.yml

3. Clone maubuz/.dotfiles
    1. Stow bash directory
    2. Install & prepare neovim kickstart
	- Clone neovim kickstart
	- Create mauvim directory and append require to nvim/init.lua
	- Stow .dotfiles/mauvim into nvim/lua/mauvim

4. Clone maubuz/mau-kmonad
    1. Follow instructions in repository (worked in Ubuntu 23.10)


5. Browser customization
    1. Firefox
	1. Login to Firefox Sync to install extensions
	2. Install extensions (manually if necessary)
	    - Tab Session Manager
	    - Copy as Markdown
	    - Bitwarden
	    - uBlock Origin
	    - Privacy Badger
            - Dark Reader
            - Vimium

    2. Brave
	1. Install deb (see ansible-homelab repo)
	2. Install extensions via script in ansible-homelab repo
	    - Tab Session Manager
	    - Copy Title and URL as Markdown Style
		- Activate the extension: Alt + Shift + C
	    - Bitwarden
	    - uBlock Origin
	    - Privacy Badger
	    - Dark Reader
	    - Vimium
	    - Tab to Window/Popup - Keyboard Shortcut

6. Gnome settings
    1. Ubuntu Desktop > Dock
	1. auto-hide the dock: ON
	2. Icon size > 36
    2. Keyboard > View and Customize Shortcuts
	1. Navigation
	    - Switch Windows: Super + Tab
	    - Switch applications: Alt + Tab
	    - Switch to workspace on left: Super + h
	    - Switch to workspace on right: Super + l
	    - Lock screen: Super + Shift + l

7. Setup Syncthing node
    1. Login to localhost:8384
    2. Add central device & folders

