# Dotfiles

First things first, install [Xcode](https://developer.apple.com/xcode/) and open it. Also if you're not me, please do not install dotfiles verbatim from this repo.

## Inital Setup
Setting up a new machine should be easy:

```
sh setup.sh
```

This installs [Homebrew](http://brew.sh/) & [Cask](http://caskroom.io/) and executes a bunch of `brew install` commands to go and setup iTerm2, Vundle, a collection of awesome utility apps, MongoDB, Node.js (this is my preferred method of installing Node it normally prevents you from having to run `sudo` all the time).


## Config
Then run the config:

```
sh config.sh
```

The config script sets up Vim and copies all my preferences for Vim, OhMyZSH, Hammerspoon, and puts them in their proper places. Plus exports [Solarized](http://ethanschoonover.com/solarized) color palettes from Github and drops the ones for iTerm2 in `~/Downloads/`.

## Projects
Copy down all my projects from Github:

```
sh repo.sh
```

This uses the great [`hub`](https://hub.github.com/) command line utility to install all my current public projects on Github.
