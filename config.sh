# Vim

mv ./vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

vim +PluginInstall +qall
vim +PlugInstall +qall

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

mv ~/Downloads/InputSystemFontReplacement_1.11/InputSystem_Fonts/*.ttf /Library/Fonts/

echo "Go to http://input.fontbureau.com/download/ to get the Input Mono for the Terminal"

svn export https://github.com/altercation/solarized/trunk/iterm2-colors-solarized

# Setup NPM
npm adduser
