#!/bin/bash

# statefile to keep track of yay install
did_install_yay="/home/meth/dotfiles/exec/did_install_yay"

# Function to figure out which linux distro
whichOS () {
  return $(cat /etc/os-release | grep -q $1);
}

install_yay() {
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay && makepkg -si && cd ..
  touch $did_install_yay
}

# List of programs to install on every distro
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

programs_arch=(
  "spotify"
  "yad"
  "bitwarden-cli"
)

# Install list of programs
if $(whichOS "debian"); then
  sudo apt install ${programs[@]}
elif $(whichOS "arch"); then
  sudo pacman -S --needed ${programs[@]}

  if [ -f "$did_install_yay" ]; then
    echo "YAY ALREADY INSTALLED"
  else
    install_yay
  fi

  yay -S --needed ${programs_arch[@]}

else
  echo "OS NOT SUPPORTD BOI"
fi

