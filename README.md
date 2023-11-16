# dotfiles
Personal dotfiles repo

## Stow Structure

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
    - `stow bash`
    - This will link all files and folders inside `.dotfiles/bash` to `~/` (the parent directory of `.dotfiles/`.
    - Stow dotfile directories to other locations using the `-t` argument

### Neovim w/ Kickstart

I'm currently using [neovim kickstart](https://github.com/nvim-lua/kickstart.nvim) to setup configuration.
The only modification required for kickstart to use these dotfiles is to append the following line to `~/.config/nvim/init.lua`:

```bash
mkdir ~/.config/nvim/lua/mauvim
echo "require('mauvim')" >> ~/.config/nvim/init.lua
```

1. Install neovim

2. Download kickstart:
`git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`

3. Stow `.dotfile/mauvim` into `~/.config/nvim/lua/mauvim`
```bash
stow -v -t ~/.config/nvim/lua/mauvim mauvim
```

