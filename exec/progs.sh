#!/bin/bash

# # Assumes system to be Debian 11
# wezterm_url="https://github.com/wez/wezterm/releases/download/20221119-145034-49b9839f/wezterm-20221119-145034-49b9839f.Debian11.deb"
# wezterm_file_name="wezterm.deb11.deb"
#
# # wezterm -> A terminal emulator with ligiture support
# wget $wezterm_url -O $wezterm_file_name
# sudo dpkg -i $wezterm_file_name
#
# # TODO: Delete files when done

programs=(
  "cool-retro-term"
  "kitty"
)

sudo apt install ${programs[@]}
