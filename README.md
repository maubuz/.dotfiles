# dotfiles
Personal dotfiles repo

## Stow Syntax

```bash
# -v verbose
# -R recursive
# -t target
stow -v -R -t <target_directory> <dotfile_directory>
```

## Instructions

### Fresh Machine Install

Follow instructions in [maubuz/ansible-homelab](https://github.com/maubuz/ansible-homelab) to install basic packages and services.

### Clone & Bash aliases

1. Clone this repo to home directory `~`
2. CD into repo clone
3. Install GNU Stow if needed. Check with `stow --version`
4. Create symbolic link between a folder in the repo and the home directory.
    ```sh
    stow bash
    ```
    - This will link all files and folders inside `.dotfiles/bash` to `~/` (the parent directory of `.dotfiles/`.
    - Stow dotfile directories to other locations using the `-t` argument

### Kmonad & Keyboard

_Known to work on Ubuntu 25.04_
1. If `stow bash` was used above, kmonad alias file already exists in `~/.bashrc.d/kmonad-aliases`
2. Follow instructions in [maubuz/mau-kmonad](https://github.com/maubuz/mau-kmonad)

### Neovim w/ Kickstart

I'm currently using [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) to setup configuration.
The only modification required for kickstart to use these dotfiles is to append `echo "required('mauvim')"` to `~/.config/nvim/init.lua`:

1. Install neovim
2. Install C compiler tooling (included in [maubuz/ansible-homelab](https://github.com/maubuz/ansible-homelab))
```sh
sudo apt install build-essential
```

3. Download kickstart:
```sh
git clone https://github.com/dam9000/kickstart-modular.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

4. Create personal configuration directory and include it in main `init.lua`
```sh
mkdir ~/.config/nvim/lua/mauvim
echo "require('mauvim')" >> ~/.config/nvim/init.lua
```

5. Stow `.dotfile/mauvim` into `~/.config/nvim/lua/mauvim`
```sh
stow -v -t ~/.config/nvim/lua/mauvim mauvim
```

### VSCode Settings

1. Install VSCode (snap)
2. Stow `.dotfiles/Code/settings.json` into `~/.config/Code/User/`
```
stow -v -t ~/.config/Code/User Code
```

### Startship CLI Prompt

1. Install Starship
2. Stow `.dotfiles/startship` into `~/.config`

```sh
stow -vt ~/.config starship
```

