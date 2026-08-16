# dotfiles
Personal dotfiles repo

## Stow Syntax

```bash
# -v verbose
# -R recursive
# -t target
stow -v -R -t <target_directory> <dotfile_directory>
```

## Requirements

1. All modules of [maubuz/ansible-homelab](https://github.com/maubuz/ansible-homelab) are installed.

## Instructions

### 1. Setup Github SSH keys

Create and add new ssh keys to Github
  1. Generate new ssh key unique to machine
  2. Login to GitHub using Yubikey

### 2. Install homelab Ansible modules

Follow instructions in [maubuz/ansible-homelab](https://github.com/maubuz/ansible-homelab) to install basic packages and services.

  1. Follow bootstrap procedure to install git and ansible
  2. Run ansible-pull on workstation playbook

  ```sh
  ansible-pull --ask-become-pass -U git@github.com:maubuz:q/ansible-homelab.git workstation.yml
  ```

### 3. Clone maubuz/.dotfiles

1. Clone this repo to home directory `~`
2. CD into repository
3. Install GNU Stow if needed and check with `stow --version`
4. Create symbolic link between a folder in the repo and the home directory.
    ```sh
    stow bash
    ```
    - This will link all files and folders inside `.dotfiles/bash` to `~/` (the parent directory of `.dotfiles/`.
    - Stow dotfile directories to other locations using the `-t` argument. See _Stow Syntax_ section above.

### 4. Kanata & Keyboard

_Known to work on Ubuntu 24.04_

Migrated from kmonad. Runs as a manually-started user-mode systemd
service.

1. Install kanata binary via `ansible-homelab/workstation/11_kanata.sh`. The script creates `~/.config/kanata/` but leaves the config file to stow.
2. Log out and back in so `input` and `uinput` group membership applies.
3. Stow `.dotfiles/kanata` into `~/.config`:
    ```sh
    stow -vt ~/.config kanata
    ```
4. Start the service:
    ```sh
    systemctl --user start kanata.service
    ```

### 5. Neovim

Neovim configuration is available in [github.com/maubuz/mauvim](https://github.com/maubuz/mauvim).

Note that the fork from kickstart-modular.nvim is no longer relevant since kickstart.nvim was abandoned in 2025.


1. Install neovim (ansible-homelab installs snap with --classic mode)
2. Install C compiler tooling (included in [maubuz/ansible-homelab](https://github.com/maubuz/ansible-homelab))
```sh
sudo apt install build-essential
```

3. Download personal config:
```sh
git clone https://github.com/maubuz/mauvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

4. Run nvim and let it install dependencies

### 6. Startship CLI Prompt

1. Install Starship
2. Stow `.dotfiles/startship` into `~/.config`
```sh
stow -vt ~/.config starship
```

### 7. Lazygit

1. Install lazygit
2. Stow `.dotfiles/lazygit` into `~/.config`
```sh
stow -vt ~/.config lazygit
```

### 8. Browser customization


1. Firefox
    1. Login to Firefox Sync to install extensions
    2. Install extensions (manually if necessary)- Tab Session Manager
        - Copy as Markdown
	- Bitwarden
	- uBlock Origin
	- Privacy Badger
	- Dark Reader
	- Vimium
    3. Didable `Alt` key shortcut to open menu
	- See https://superuser.com/a/1752405
	- about:config > ui.key.menuAccessKey = 17

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

### 9. Gnome settings

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

### 10. Setup Syncthing node

1. Login to localhost:8384
2. Add central device & folders

### 11. VSCode Settings

1. Install VSCode (snap)
2. Stow `.dotfiles/Code/settings.json` into `~/.config/Code/User/`

```
stow -v -t ~/.config/Code/User Code
```
