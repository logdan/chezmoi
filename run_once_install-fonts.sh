#!/bin/sh
# Download and install fonts
mkdir -p $HOME/Downloads
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts $HOME/Downloads/nerd-fonts
cd $HOME/Downloads/nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
git sparse-checkout add patched-fonts/Meslo
git sparse-checkout add install.sh

./install.sh JetBrainsMono
./install.sh Meslo

cd $HOME
rm -rf $HOME/Downloads/nerd-fonts
