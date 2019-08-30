#!/bin/bash

#TODO Recreate in a linux machine
#function linux_install() {
  #if [ -f /usr/bin/apt-get ]; then
    #packager="apt-get"
    #packs="exuberant-ctags silversearcher-ag ncurses-term libjson-xs-perl vim-gtk" 
  #elif [ -f /usr/bin/yum ]; then
    #packager="yum"
    #packs="ctags-etags the_silver_searcher ncurses-term perl-JSON-XS" 
  #else
    #echo "ERR: Package Manager not indentified. Please install manually."
    #exit 1
  #fi

  #echo "Installing pre-requisites..."
  #for pack in $packs; do
    #sudo $packager install $pack -y
  #done
  
  #echo "Configuring VIM..."
  #if [ ! -d ~/.fonts/ ]; then
   #mkdir ~/.fonts
   #if [ ! -f ~/.fonts/PowerlineSymbols.otf ]; then
     #wget "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
     #mv PowerlineSymbols.otf ~/.fonts/
   #fi
  #fi

  #if [ ! -d ~/.config/fontconfig/conf.d/ ]; then
   #mkdir -p ~/.config/fontconfig/conf.d/
   #if [ ! -f ~/.config/fontconfig/conf.d/10-powerline-symbols.conf ]; then
     #wget "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
     #mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
   #fi
  #fi
  
  #echo "Installing Plugins..."
  #git submodule update --init
#}

#linux_install
