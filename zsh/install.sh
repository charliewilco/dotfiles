#!/bin/sh

if test $(which zsh)
then
  echo 'Installing Prezto'
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

exit 0
