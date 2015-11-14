# Vim

mv ./vimrc ~/.vimrc

vim +PluginInstall +qall
vim +PlugInstall +qall

# ZSH
mv ./zshrc ~/.zshrc
mv ./aliases ~/.aliases

# Git Config
mv ./gitconfig ~/.gitconfig
mv ./gitignore ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Hammerspoon
mv ./hammerspoon ~/.hammerspoon/init.lua

# iTerm Color Palettes & Fonts
cd ~/Downloads
wget http://input.fontbureau.com/systemfont/InputSystemFontReplacement.zip
unzip InputSystemFontReplacement.zip

mv ~/Downloads/InputSystemFontReplacement_1.11/InputSystem_Fonts/*.ttf /Library/Fonts/

echo "Go to http://input.fontbureau.com/download/ to get the Input Mono for the Terminal"

svn export https://github.com/whatyouhide/gotham-contrib/trunk/iterm2

# Setup NPM
npm adduser
