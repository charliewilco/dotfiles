#!/bin/sh

if test $(which nvim)
then
  echo 'Setting up Vim and NeoVim'
  echo 'Installing vim-plug'
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  echo 'Linking directories'
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PlugClean! +PlugInstall! +qall
fi

exit 0
