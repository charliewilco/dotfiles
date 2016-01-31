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
mv ./hammerspoon.lua ~/.hammerspoon/init.lua

# iTerm2 Color Palettes & Fonts
cd ~/Downloads
wget http://input.fontbureau.com/systemfont/InputSystemFontReplacement_ElCapitan.zip
unzip InputSystemFontReplacement_ElCapitan.zip
mv ~/Downloads/InputSystem_Fonts_ElCapitan/SystemFont_TTF/*.ttf /Library/Fonts/
echo "Go to http://input.fontbureau.com/download/ to get the Input Mono for the Terminal"

svn export https://github.com/mhartington/oceanic-next-iterm/trunk/
echo "Import Oceanic Next in to Preferences > Profiles > Colors and then Load Presets > Import"

# Setup NPM
npm adduser
