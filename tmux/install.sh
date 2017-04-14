#!/bin/sh

if test $(which tmux)
then
  echo 'Setting up tmux'
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins
fi

exit 0
