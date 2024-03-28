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

1. Install GNU Stow
2. Clone this repo to home directory `~`
3. CD into repo clone
4. Create symbolic link between a folder in the repo and the home directory.
    ```sh
    stow bash
    ```
    - This will link all files and folders inside `.dotfiles/bash` to `~/` (the parent directory of `.dotfiles/`.
    - Stow dotfile directories to other locations using the `-t` argument

### Neovim w/ Kickstart

I'm currently using [neovim kickstart](https://github.com/nvim-lua/kickstart.nvim) to setup configuration.
The only modification required for kickstart to use these dotfiles is to append `echo "required('mauvim')"` to `~/.config/nvim/init.lua`:



1. Install neovim
2. Install C compiler tooling
```sh
sudo apt install build-essential
```

3. Download kickstart:
```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
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



