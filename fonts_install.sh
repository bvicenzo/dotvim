#!/bin/bash
function fonts_install() {
  echo -ne "\t+ Getting powerline fonts...\n"

  if [ -d ./fonts ]; then
    rm -rf ./fonts
  fi

  $(git clone https://github.com/terroo/fonts.git)
  
  # Fork of https://github.com/powerline/fonts
  powerline_fonts_dir=$( cd "$( dirname "$0" )" && pwd )
  find_command="find \"$powerline_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"
  
  if [[ `uname` == 'Darwin' ]]; then
    font_dir="$HOME/Library/Fonts"
  else
    font_dir="$HOME/.fonts"
    mkdir -p $font_dir
  fi
  
  # Copy all fonts to user fonts directory
  eval $find_command | xargs -0 -I % cp "%" "$font_dir/"
  
  # Reset font cache on Linux
  if [[ -n `which fc-cache` ]]; then
    fc-cache -f $font_dir
  fi

  if [ -d ./fonts ]; then
    rm -rf ./fonts
  fi

  echo -ne "\t+ Powerline fonts installed to $font_dir\n"
}

echo -ne "\t+ Getting powerline fonts...\n"
# Call fonts_install function 
fonts_install 
