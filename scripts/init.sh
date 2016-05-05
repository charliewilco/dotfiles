get_started () {
  git clone https://github.com/charlespeters/dotfiles.git ~/.dotfiles

  cd ~/.dotfiles
  sudo sh ./scripts/bootstrap.sh && sudo sh setup.sh
}


get_started
