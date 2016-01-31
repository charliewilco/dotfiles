# Removes the existing files and replaces them with symlinks

rm -rf ~/.aliases
ln -s ~/Projects/personal/dotfiles/aliases ~/.aliases

rm -rf ~/.agignore
ln -s ~/Projects/personal/dotfiles/agrc ~/.agignore

rm -rf ~/.gitconfig
ln -s ~/Projects/personal/dotfiles/gitconfig ~/.gitconfig

rm -rf ~/.gitignore
ln -s ~/Projects/personal/dotfiles/gitignore ~/.gitignore_global

rm -rf ~/.vimrc
ln -s ~/Projects/personal/dotfiles/vimrc ~/.vimrc

rm -rf ~/.hammerspoon/init.lua
ln -s ~/Projects/personal/dotfiles/hammerspoon.lua ~/.hammerspoon/init.lua

rm -rf ~/.tmux.conf
ln -s ~/Projects/personal/dotfiles/tmuxrc ~/.tmux.conf

rm -rf ~/.zshrc
ln -s ~/Projects/personal/dotfiles/zshrc ~/.zshrc

rm -rf ~/.eslintrc
ln -s ~/Projects/personal/dotfiles/eslintrc ~/.eslintrc

rm -rf ~/.jscsrc
ln -s ~/Projects/personal/dotfiles/jscsrc ~/.jscsrc
