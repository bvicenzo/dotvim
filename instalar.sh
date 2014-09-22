#!/bin/bash

echo "instalando o Vim..."
sudo apt-get install exuberant-ctags ncurses-term ack-grep

echo "Configurando Vim..."

if [ ! -d ~/.fonts/ ]; then
 mkdir ~/.fonts
 if [ ! -f ~/.fonts/PowerlineSymbols.otf ]; then
   wget "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
   mv PowerlineSymbols.otf ~/.fonts/
 fi
fi

if [ ! -d ~/.config/fontconfig/conf.d/ ]; then
 mkdir -p ~/.config/fontconfig/conf.d/
 if [ ! -f ~/.config/fontconfig/conf.d/10-powerline-symbols.conf ]; then
   wget "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
   mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
 fi
fi

echo "Instalando Plugins..."
git submodule update --init
