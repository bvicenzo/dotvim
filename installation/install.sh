#!/bin/bash
# ChickiVim install for linux and macosx
# credits for rabeloo at gmail dot com
# source: https://github.com/rabeloo/belovim/blob/master/install.sh

 
echo -ne "\t+ Cloning Vundle...\n"
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

current_dir="$(pwd)/installation"

source "$current_dir/fonts_install.sh"

if [[ $(uname) == 'Darwin' ]]; then
  source "$current_dir/mac_install.sh"
else
  source "$current_dir/linux_install.sh"
fi

# Create symbolic link
if [ -e ~/.vimrc ]; then
  unlink ~/.vimrc
fi
if [ -e ~/.vim ]; then
  unlink ~/.vim
fi

if [ ! -e ~/.vimrc ]; then
  ln -s $(pwd)/vimrc ~/.vimrc
fi
if [ ! -e ~/.vim ]; then
  ln -s $(pwd) ~/.vim
fi
