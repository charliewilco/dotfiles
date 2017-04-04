DOTFILES_ROOT=$(pwd -P)

if test $(which npm)
then
  echo 'Setting up all your favorite NPM nicities'
  cat "$DOTFILES_ROOT/node/deps" | xargs -n1 npm install --global
  npm update -g
fi

exit 0
