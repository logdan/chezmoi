#!/bin/sh
# Install packages for shell runs

sudo apt install ripgrep

sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

sudo apt install exa
