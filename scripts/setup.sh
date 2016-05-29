DOTFILES_ROOT=$(pwd -P)

setup_brew () {
  # Clean Up Homebrew
  rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install Dependencies
  brew bundle

  # Update brew
  brew update
}

setup_zsh () {
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
}

setup_vim_tmux () {
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PluginClean! +PluginInstall! +qall

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "Don't forget to install tmux plugins prefix + I"
}


# Install iTerm2 because I prefer it
get_iterm () {
  echo "go find the latest and best iTerm2 and install it"
}

fix_iterm () {
  # iTerm2 Color Palettes & Fonts
  wget http://input.fontbureau.com/systemfont/InputSystemFontReplacement_ElCapitan.zip -P ~/Downloads/
  # unzip ~/Downloads/InputSystemFontReplacement_ElCapitan.zip
  # mv ~/Downloads/InputSystem_Fonts_ElCapitan/SystemFont_TTF/*.ttf /Library/Fonts/
  echo "Go to http://input.fontbureau.com/download/ to get the Input Mono for the Terminal"

  svn export https://github.com/mhartington/oceanic-next-iterm/trunk/ ~/Downloads/oceanic/
  echo "Import Oceanic Next in to Preferences > Profiles > Colors and then Load Presets > Import"
}

setup_npm () {
  cat "$DOTFILES_ROOT/scripts/npm-deps" | xargs -n1 npm install -g
  npm update -g
  # Setup NPM
  npm adduser
}

setup_osx () {
  sh "$DOTFILES_ROOT/scripts/osx.sh"
}

setup_iterm () {
  get_iterm
  fix_iterm
}

setup_all () {
  setup_brew
  setup_zsh
  setup_vim_tmux
  setup_npm
  setup_iterm
  setup_osx
}
