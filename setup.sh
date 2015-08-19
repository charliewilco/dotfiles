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

# Update NPM
npm update -g npm

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
npm install -g babel
npm install -g bower
npm install -g browser-sync
npm install -g browserify
npm install -g caniuse-cmd
npm install -g cssstats
npm install -g dark-mode
npm install -g ember-cli
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g express-generator
npm install -g forever
npm install -g gulp
npm install -g gulp-devtools
npm install -g huxley-cli
npm install -g imageoptim-cli
npm install -g jade
npm install -g karma-cli
npm install -g node-inspector
npm install -g node-libs-browser
npm install -g node-slack-cli
npm install -g nodemon
npm install -g npm-name
npm install -g pageres-cli
npm install -g parker
npm install -g phantomjs
npm install -g psi
npm install -g rimraf
npm install -g sails
npm install -g sails-generate-backend-gulp
npm install -g sails-generate-frontend-gulp
npm install -g sails-generate-gulpfile
npm install -g sails-generate-new-gulp
npm install -g sane-cli
npm install -g stylus
npm install -g supervisor
npm install -g surge
npm install -g svgo tmi
npm install -g trash
npm install -g vulcanize
npm install -g webpack
npm install -g watchify
npm install -g wifi-password
npm install -g yo
npm install -g gulp-cli@0.2.0

# Brew Casks
brew install caskroom/cask/brew-cask

# Cask Install a Ton of Things
brew cask install 1password alfred cloud dropbox github google-chrome hammerspoon imageoptim keepingyouawake rdio slack sketch screenhero sketch-toolbox
