# Dotfiles

First things first, install [Xcode](https://developer.apple.com/xcode/) and open it or try and run `xcode-select --install`. Also if you're not me, please do not install dotfiles verbatim from this repo.

## Inital Setup & Config

Setting up a new machine should be easy. Run:

```Shell
bash -c "$(curl -LsS https://raw.github.com/charlespeters/dotfiles/master/scripts/init.sh)"
```

### Setup

This installs [Homebrew](http://brew.sh/) & [Cask](http://caskroom.io/) and executes a bunch of `brew install` commands to go and setup iTerm2, Vundle, tpm a collection of awesome utility apps, MongoDB, Node.js (this is my preferred method of installing Node it normally prevents you from having to run `sudo` all the time).

The config script sets up Vim and copies all my preferences for Vim / NeoVim, tmux, OhMyZSH, Hammerspoon, and puts them in their proper places. Plus exports [Oceanic Next](https://github.com/mhartington/oceanic-next-iterm) color palettes from Github and drops the ones for iTerm2 in `~/Downloads/`.

## Cheatsheet

There's a [cheatsheet](https://github.com/charlespeters/dotfiles/blob/master/cheatsheet.md) for very common things I do with Vim and command line utilities (ie `ag`, `hub`, and more to come).

## SSH

You need to create a file for SSH `~/.ssh/config` with the following contents:

```sh
Host *
    UseKeychain yes
```

It solves a lot of isses with macOS Sierra and SSH that didn't exist in previous versions.

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
- [Fork](https://github.com/charlespeters/dotfiles#fork-destination-box) this repo.
- Push to your fork and submit a pull request.
- Please provide a short explanation of why you made the changes you made.

## License
MIT

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
