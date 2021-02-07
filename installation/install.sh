#!/bin/bash
# ChickiVim install for linux and macosx
# credits for rabeloo at gmail dot com
# source: https://github.com/rabeloo/belovim/blob/master/install.sh

VIM_PATH="$HOME/.vim"
INSTALLATION_PATH="$VIM_PATH/installation"

echo -ne "\t+ Installing Plug...\n"
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

#source "$INSTALLATION_PATH/fonts_install.sh"

if [[ $(uname) == 'Darwin' ]]; then
  source "$INSTALLATION_PATH/mac_install.sh"
else
  source "$INSTALLATION_PATH/linux_install.sh"
fi

# Install Plugins
vim +PlugInstall +qall

# Create symbolic link
echo -ne "\t+ Linking vimrc file...\n"
if [ -e "$HOME/.vimrc" ]; then
  unlink "$HOME/.vimrc" 
fi

if [ ! -e "$HOME/.vimrc"  ]; then
  ln -s "$VIM_PATH/vimrc" "$HOME/.vimrc" 
fi
