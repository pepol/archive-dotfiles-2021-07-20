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
  exit 1
}

usage() {
  echo "Usage: $0 [-d] [-hu] [targets...]"
  echo
  exit 1
}

ALL_TARGETS="git i3 dwm scripts bash zsh tmux utils"
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
# TODO: Make target "all" change to $ALL_TARGETS.

# TODO: Add bootstrapping procedure (config linking).


# TODO: Add requirements downloading (vim plugins, tmux powerline, etc.).
