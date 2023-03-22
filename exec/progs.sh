#!/bin/bash

# Function to figure out which linux distro
whichOS () {
  return $(cat /etc/os-release | grep -q $1);
}

# List of programs to install using apt
programs=(
  "cool-retro-term"
  "kitty"
  "fzf"
  "tmux"
  "ripgrep"
  "xclip"
  "calibre"             # Library manager
  "doxygen"
  "swig"
  "i3"
)

# Install list of programs
if $(whichOS "debian"); then
  sudo apt install ${programs[@]}
elif $(whichOS "arch"); then
  sudo pacman -S ${programs[@]}
else
  echo "OS NOT SUPPORTD BOI"
fi

