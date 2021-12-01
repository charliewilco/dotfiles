# Dotfiles

First things first, install [Xcode](https://developer.apple.com/xcode/) and open it or try and run `xcode-select --install`. Also if you're not me, please do not install dotfiles verbatim from this repo.

## Inital Setup & Config

Setting up a new machine should be easy. Run:

```Shell
curl -L https://raw.githubusercontent.com/charliewilco/dotfiles/main/init.sh | bash -s -- all
```

### Setup

This installs [Homebrew](http://brew.sh/) & [Cask](http://caskroom.io/) and executes a bunch of `brew install` commands to go and setup iTerm2, Vundle, tpm a collection of awesome utility apps, MongoDB, Node.js (this is my preferred method of installing Node it normally prevents you from having to run `sudo` all the time).

The config script sets up Vim and copies all my preferences for Vim / NeoVim, tmux, OhMyZSH, Hammerspoon, and puts them in their proper places. Plus exports [Oceanic Next](https://github.com/mhartington/oceanic-next-iterm) color palettes from Github and drops the ones for iTerm2 in `~/Downloads/`.

## Cheatsheet

There's a [cheatsheet](https://github.com/charliewilco/dotfiles/blob/master/cheatsheet.md) for very common things I do with Vim and command line utilities (ie `ag`, `hub`, and more to come).

## SSH

You need to create a file for SSH `~/.ssh/config` with the following contents:

```sh
Host *
    UseKeychain yes
```

It solves a lot of isses with macOS Sierra and SSH that didn't exist in previous versions.

## tmux colors + _Italics_

There are two files here with the `.terminfo` extension, do the following with them:

```shell
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo
```

```vim
if has('termguicolors')
	" Don't need this in xterm-256color, but do need it inside tmux.
	" (See `:h xterm-true-color`.)
	if &term =~# 'tmux-256color'
		let &t_8f="\e[38;2;%ld;%ld;%ldm"
		let &t_8b="\e[48;2;%ld;%ld;%ldm"
	endif
endif
```

```tmux
set -g default-terminal 'tmux-256color'
set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
```

## Other Dotfiles

This is the list of dotfiles I've looked through and learned something cool from:

- [Zach Holman](https://github.com/holman/dotfiles)
- [Thoughtbot](https://github.com/thoughtbot/dotfiles)
- [Mike Hartington](https://github.com/mhartington/dotfiles)
- [Colby Williams](https://github.com/colbycheeze/dotfiles)
- [Dan Eden](https://github.com/daneden/dotfiles)
- [Cole Peters](https://github.com/colepeters/dotfiles)
- [Helen Holmes](https://github.com/helenvholmes/dotfiles)

## Contributing

First off, you're awesome for wanting to contribute. Second, please take a second to go over a few things to make this process simpler for everyone. Third, you're awesome.

### Pull Requests

- [Fork](https://github.com/charliewilco/dotfiles#fork-destination-box) this repo.
- Push to your fork and submit a pull request.
- Please provide a short explanation of why you made the changes you made.

## License

The Unlicense
