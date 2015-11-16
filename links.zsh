# Removes the existing files and replaces them with symlinks

rm -rf ~/.aliases
ln -s ~/Projects/personal/dotfiles/aliases ~/.aliases

rm -rf ~/.vimrc
ln -s ~/Projects/personal/dotfiles/vimrc ~/.vimrc

rm -rf ~/.hammerspoon/init.lua
ln -s ~/Projects/personal/hammerspoon.lua ~/.hammerspoon/init.lua

rm -rf ~/.zshrc
ln -s ~/Projects/personal/dotfiles/zshrc ~/.zshrc
