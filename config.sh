# Vim

mv ./vimrc ~/.vimrc
vim +PluginInstall +qall

# ZSH
mv ./zshrc ~/.zshrc

# Git Config
mv ./gitconfig ~/.gitconfig

# Hammerspoon
mv ./hammerspoon ~/.hammerspoon/init.lua

# Sails.js
mv ./sailsrc ~/.sailsrc

# iTerm Color Palettes & Fonts
cd ~/Downloads
wget http://input.fontbureau.com/systemfont/InputSystemFontReplacement.zip
unzip InputSystemFontReplacement.zip

echo "Go to http://input.fontbureau.com/download/ to get the Input Mono for the Terminal"

svn export https://github.com/altercation/solarized/trunk/iterm2-colors-solarized

# Setup NPM
npm adduser
