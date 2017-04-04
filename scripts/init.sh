#!/bin/sh

git clone https://github.com/charlespeters/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

echo "› Getting started with your .dotfiles"
sh ~/.dotfiles/scripts/bootstrap
