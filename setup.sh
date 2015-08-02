# Show Hidden Files
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder


# Clean Up Homebrew
rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Install git
brew install git svn wget hub watchman

# Update brew
brew update

# Install Node & MongoDB
brew install node
brew install mongodb

# Install Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install iTerm2 because I prefer it
cd ~/Downloads
wget http://iterm2.googlecode.com/files/iTerm2_v1_0_0.zip
unzip iTerm2_v1_0_0.zip
cp -r iTerm.app ~/Applications/ && echo "iTerm2 installed"


# Install MacVim
brew install macvim --override-system-vim

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Common Node Globals
npm install -g babel bower browser-sync browserify caniuse-cmd cssstats dark-mode ember-cli express-generator forever gulp gulp-devtools  huxley imageoptim-cli jade karma-cli node-inspector node-libs-browser node-slack-cli nodemon npm npm-name pageres-cli parker phantomjs psi rimraf sails sails-generate-backend-gulp sails-generate-frontend-gulp sails-generate-gulpfile sails-generate-new-gulp sane-cli stylus supervisor surge svgo tmi trash vulcanize webpack yo gulp-cli@0.2.0

# Brew Casks
brew install caskroom/cask/brew-cask

# Cask Install a Ton of Things
brew cask install 1password alfred dropbox github google-chrome hammerspoon imageoptim keepingyouawake slack sketch screenhero sketch-toolbox
