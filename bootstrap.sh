#!/bin/bash

longhelp() {
  echo "DotFiles v. 1.0"
  echo "Copyright (c) 2015 Peter Polacik <polacik.p@gmail.com>"
  echo
  echo "This script bootstraps my dotfiles for use in your system."
  echo
  echo "Options:"
  echo -e "\t-d  - if used, also downloads any dependencies (such as Vim plugins)"
  echo -e "\t-h  - shows this help message"
  echo -e "\t-u  - shows short usage information"
  echo
  echo "Targets:"
  echo -e "\tall      - (default) installs all configuration files"
  echo -e "\tgit      - installs only git files"
  echo -e "\ti3       - installs i3 files"
  echo -e "\tdwm      - installs dwm files"
  echo -e "\tscripts  - installs scripts"
  echo -e "\tbash     - installs bash files"
  echo -e "\tzsh      - installs zsh files"
  echo -e "\ttmux     - installs tmux files"
  echo -e "\tutils    - installs utilities (fonts, X configs, notification configs)\n"
  echo -e "\tlisp     - installs lisp files (.sbclrc, source registry configs)\n"
  exit 1
}

usage() {
  echo "Usage: $0 [-d] [-hu] [targets...]"
  echo
  exit 1
}

ALL_TARGETS="git i3 dwm scripts bash zsh tmux utils lisp"
TARGETS="all"
DOWNLOAD=0

OPTIND=1

while getopts dhu opt; do
  case "$opt" in
    d) DOWNLOAD=1 ;;
    h) longhelp ;;
    u) usage ;;
    \?) usage ;;
  esac
done

shift $((OPTIND - 1))

[ "$1" = "--" ] && shift

[[ -n "$@" ]] && TARGETS="$@"


local all=0
local git=0
local i3=0
local dwm=0
local scripts=0
local bash=0
local zsh=0
local tmux=0
local utils=0
local lisp=0

for target in $TARGETS; do
  case "$target" in
    "all") all=1 ;;
    "git") git=1 ;;
    "i3") i3=1 ;;
    "dwm") dwm=1 ;;
    "scripts") scripts=1 ;;
    "bash") bash=1 ;;
    "zsh") zsh=1 ;;
    "tmux") tmux=1 ;;
    "utils") utils=1 ;;
    "lisp") lisp=1 ;;
  esac
done

[[ ( $all -eq 1 ) -o ( $git -eq 1 ) ]] && ln -sf gitconfig ~/.gitconfig && ln -sf gitignore_global ~/.gitignore_global
[[ ( $all -eq 1 ) -o ( $i3 -eq 1 ) ]] && ln -sf i3 ~/.i3 && ln -sf i3status.conf ~/.i3status.conf
[[ ( $all -eq 1 ) -o ( $dwm -eq 1 ) ]] && mkdir -p build && cd build && wget http://dl.suckless.org/dwm/dwm-6.0.tar.gz && tar -xzf dwm-6.0.tar.gz && wget http://dwm.suckless.org/patches/dwm-6.0-deck.diff && wget http://dwm.suckless.org/patches/dwm-6.0-pertag.diff && wget http://dwm.suckless.org/patches/dwm-6.0-systray.diff && cd .. && ln -sf dwmconfig.h build/dwm-6.0/config.h
[[ ( $all -eq 1 ) -o ( $scripts -eq 1 ) ]] && ln -sf scripts ~/scripts
[[ ( $all -eq 1 ) -o ( $bash -eq 1 ) ]] && ln -sf bashrc ~/.bashrc
[[ ( $all -eq 1 ) -o ( $zsh -eq 1 ) ]] && ln -sf zshrc ~/.zshrc
[[ ( $all -eq 1 ) -o ( $tmux -eq 1 ) ]] && ln -sf tmux.conf ~/.tmux.conf && ln -sf tmux.minimal.conf ~/.tmux.minimal.conf
[[ ( $all -eq 1 ) -o ( $utils -eq 1 ) ]] && mkdir -p ~/.fonts && cp fonts/PowerlineSymbols.otf ~/fonts/ && mkdir -p ~/.config/fontconfig/conf.d && cp fontconfig/conf.d/* ~/.config/fontconfig/conf.d && ln -sf xinitrc ~/.xinitrc && ln -sf Xdefaults ~/.Xdefaults && mkdir -p ~/.config/dunst && ln -sf dunstrc ~/.config/dunst/dunstrc
[[ ( $all -eq 1 ) -o ( $lisp -eq 1) ]] && ln -sf sbclrc ~/.sbclrc
[[ ( $all -eq 1 ) -o ( $lisp -eq 1) ]] && mkdir -p ~/.config/common-lisp && ln -sf common-lisp/source-registry-conf.d ~/.config/common-lisp/source-registry-conf.d

# TODO: Add requirements downloading (vim plugins, tmux powerline, etc.).
