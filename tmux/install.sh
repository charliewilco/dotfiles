#!/bin/sh

if test $(which tmux)
then
  echo 'Setting up tmux'
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  if "test ! -d ~/.tmux/plugins/tpm"
  then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins
  fi

fi

exit 0
