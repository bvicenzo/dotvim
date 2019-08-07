#!/bin/bash

function mac_install() {
  echo -ne "\t+ Check dependencies...\n"
  brew install ag python
  
  echo -ne "\t+ Installing Deoplete dependency"
  pip3 install --user --upgrade pynvim
  
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
