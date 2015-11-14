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
npm install -g

# Brew Casks
brew install caskroom/cask/brew-cask

# Cask Install a Ton of Things
brew cask install 1password alfred cloud dropbox github google-chrome hammerspoon imageoptim keepingyouawake rdio slack sketch screenhero sketch-toolbox
