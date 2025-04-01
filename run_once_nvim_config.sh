#!/bin/sh

# Install AstroNvim
if [ ! -e "$HOME"/.config/nvim/init.lua ]; then
  echo "Clone AstroNvim"
  git clone git@github.com:kforsthoevel/astronvim_config ~/.config/nvim
fi
