# Try and Install Command Line Tools without Xcode
xcode-select --install

# Clean Up Homebrew
rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Dependencies
brew bundle

# Update brew
brew update

# Update NPM
npm update -g npm

# Install Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install iTerm2 because I prefer it
cd ~/Downloads
wget http://iterm2.googlecode.com/files/iTerm2_v1_0_0.zip
unzip iTerm2_v1_0_0.zip
cp -r iTerm.app ~/Applications/ && echo "iTerm2 installed"
cd ~/

# Install MacVim
brew install macvim --with-override-system-vim

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Common Node Globals
npm install -g

# Python Dependencies
sudo easy_install pip
pip install codemod
pip install thefuck
