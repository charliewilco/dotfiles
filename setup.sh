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
## Breaking up the Install List Yields Less Errors
npm install -g babel bower browser-sync browserify
npm install -g caniuse-cmd cssstats dark-mode
npm install -g ember-cli express-generator forever
npm install -g gulp gulp-devtools huxley imageoptim-cli
npm install -g jade karma-cli node-inspector
npm install -g node-libs-browser node-slack-cli nodemon
npm install -g npm npm-name pageres-cli parker phantomjs
npm install -g psi rimraf sails sails-generate-backend-gulp
npm install -g sails-generate-frontend-gulp sails-generate-gulpfile
npm install -g sails-generate-new-gulp sane-cli stylus supervisor
npm install -g surge svgo tmi trash vulcanize
npm install -g webpack yo gulp-cli@0.2.0

# Brew Casks
brew install caskroom/cask/brew-cask

# Cask Install a Ton of Things
brew cask install 1password alfred dropbox github google-chrome hammerspoon imageoptim keepingyouawake slack sketch screenhero sketch-toolbox
