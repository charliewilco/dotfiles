#!/bin/sh

if test $(which nvim)
then
  echo 'Setting up Vim and NeoVim'
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PluginClean! +PluginInstall! +qall
fi

exit 0
