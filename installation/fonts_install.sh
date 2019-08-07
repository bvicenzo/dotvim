#!/bin/bash
function fonts_install() {
  echo -ne "\t+ Getting powerline fonts...\n"

  if [ -d "$CLONED_FONTS" ]; then
    rm -rf "$CLONED_FONTS"
  fi

  CLONED_FONTS="$INSTALLATION_PATH/fonts/"
  $(git clone https://github.com/terroo/fonts.git "$CLONED_FONTS")
  
  # Fork of https://github.com/terroo/fonts.git)
  find_command="find \""$CLONED_FONTS"\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"
  
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

  if [ -d "$CLONED_FONTS" ]; then
    rm -rf "$CLONED_FONTS"
  fi

  echo -ne "\t+ Powerline fonts installed to $font_dir\n"
}

# Call fonts_install function 
fonts_install 
