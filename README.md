dotfiles
========

My configuration files


# Installation

Copy each file to its location as noted by the following:

 - `bashrc` to `~/.bashrc`
 - `dunstrc` to `~/.config/dunst/dunstrc`
 - `dwmconfig.h` to `config.h` in `dwm` build directory
 - `gitconfig` to `~/.gitconfig`
 - `gitignore_global` to `~/.gitignore_global`
 - `i3` to `~/.i3`
 - `i3status.conf` to `~/.i3status.conf`
 - `i3status.dwm.conf` to `~/.i3status.dwm.conf`
 - `stconfig.h` to `config.h` in `st` build directory
 - `tmux.conf` to `.tmux.conf`
 - `tmux.minimal.conf` to `.tmux.minimal.conf`
 - `vimrc` to `.vimrc`
 - `Xdefaults` to `.Xdefaults`
 - `xinitrc` to `.xinitrc`
 - `zshrc` to `.zshrc`

where `~` means your home directory.

## vim

For `vimrc` to work correctly, install `pathogen` plugin manager (or modify
the config file for your plugin manager of choice). Following vim plugins are
used:
 - `syntastic`
 - `tagbar`
 - `vim-airline`
 - `vim-easytags`
 - `vim-fugitive`
 - `vim-slime`
