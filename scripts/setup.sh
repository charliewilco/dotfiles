# Try and Install Command Line Tools without Xcode
xcode-select --install

setup-brew () {
  # Clean Up Homebrew
  rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install Dependencies
  brew bundle

  # Update brew
  brew update
}

setup-zsh () {
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
}

setup-vim_tmux () {
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PluginClean! +PluginInstall! +qall

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}


# Install iTerm2 because I prefer it
get-iterm () {
  cd ~/Downloads
  wget https://iterm2.com/downloads/beta/iTerm2-2_9_20160426.zip
  unzip iTerm2-2_9_20160426.zip
  cp -r iTerm.app ~/Applications/ && echo "iTerm2 installed"
  cd ~/
}


setup-npm () {
  npm install -g \
    babel-cli \
    browser-sync \
    ember-cli \
    empty-trash-cli \
    eslint \
    express-generator \
    firebase-tools \
    forever \
    gulp-cli \
    karma-cli \
    nodemon \
    postcss-cli \
    stylelint \
    surge \
    trash-cli \
    tldr \
    vtop \
    wifi-password

  npm update -g
}

setup-py () {
  sudo easy_install pip
  pip install \
    thefuck \
    codemod \
}

fix-iterm () {
  # iTerm2 Color Palettes & Fonts
  cd ~/Downloads
  wget http://input.fontbureau.com/systemfont/InputSystemFontReplacement_ElCapitan.zip
  unzip InputSystemFontReplacement_ElCapitan.zip
  mv ~/Downloads/InputSystem_Fonts_ElCapitan/SystemFont_TTF/*.ttf /Library/Fonts/
  echo "Go to http://input.fontbureau.com/download/ to get the Input Mono for the Terminal"

  svn export https://github.com/mhartington/oceanic-next-iterm/trunk/
  echo "Import Oceanic Next in to Preferences > Profiles > Colors and then Load Presets > Import"
}

setup-iterm () {
  get-iterm
  fix-iterm
}

setup-{brew,zsh,vim_tmux,npm,iterm}
