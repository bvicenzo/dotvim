#!/bin/bash

function mac_install() {
  echo -ne "\t+ Check dependencies...\n"
  brew install node ag ripgrep fzf

  echo "installing yarn..."
  npm install -g yarn

  echo "Adding useful fzf key bindings"
  $(brew --prefix)/opt/fzf/install --no-bash --no-fish
  
  echo "************* IMPORTANT ************
  
  Please change the font of your current profile in iTerm2:
  
  In iTerm2 go to:
   
  1. Preferences > Profile
  2. Select the text tab
  3. Change the Regular and Non-ASCII using fonts for Powerline:
  
  Suggest: RobotoMono Nerd Font
  
  Enjoy it!
  Thanks!
  ***********************************"
}

mac_install
